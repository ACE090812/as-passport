# as-passport

Passports for the server. A player applies on **lsgov.co.uk** (the `as-browser` government site), pays from their bank, waits, and the passport is delivered to a **Postal Prime** locker as an inventory item. The item opens as a passport ID card with the character's mugshot, and can be shown to the person next to you.

## What it does

- **Types and prices** (all in `config.lua`): standard £75 (about 1 hour), fast track £150 (about 10 minutes), replace a lost passport £40, renew or update details £25.
- **Photo**: the character mugshot is taken when the player pays (MugShotBase64) and stored in the database, not in the item.
- **Number**: a unique 9 digit passport number, printed on the card and in the machine readable lines.
- **Delivery**: sent to the Postal Prime locker the player picked. They get an email and a phone notification. The card is also saved as a text document in the Files app (in a "Passport" folder) when the passport is collected.
- **Never expires** by default (`Config.validDays = 0`). Set real days to make passports expire.
- **Lost passports**: a replacement application cancels the old passport immediately. A renewal keeps the old one working until the new one is issued. Any new passport cancels older ones.
- **ID card**: using the item opens the card. "Show to person nearby" shows it to the nearest player within 3 metres. A cancelled or expired passport shows a red INVALID or EXPIRED stamp.
- **Discord log** of applications, issues, collections and revokes (`Config.webhook`). This is the only staff tooling.

## Requirements

- `ox_lib`, `oxmysql`, `sd-phone`
- `as-browser` (the government site has the application pages)
- `as-postalprime` **with the parcel edit described below** (without it, passports go straight into the inventory)
- **MugShotBase64** for the photo. If it is missing, or `Config.photo.enabled = false`, passports are issued with no photo (a silhouette is shown). Set `Config.photo.required = true` to refuse applications when the photo fails.
- Framework: qbx_core, qb-core or es_extended. Inventory: ox_inventory or qb-inventory. Both are detected automatically, or set `Config.framework` and `Config.inventory`.

## Install

1. Put the `as-passport` folder in your resources (for example `[phone]`).
2. Add the item definition for your inventory (files in `install/`) and copy `install/passport.png` into the inventory's images folder.
   - ox_inventory: `install/ox_inventory_item.lua` (the important line is `client = { event = 'as-passport:client:useItem' }`).
   - qb-inventory: `install/qb_inventory_item.lua`. The script registers the item as usable itself.
3. Start order in `server.cfg`:

   ```
   ensure oxmysql
   ensure ox_lib
   ensure sd-phone
   ensure MugShotBase64
   ensure as-postalprime
   ensure as-browser
   ensure as-passport
   ```

4. `refresh`, then restart `as-browser` and start `as-passport`. The `as_passports` table is created automatically.
5. Optional: put a Discord webhook URL in `Config.webhook`. `config.lua` is server only, so the webhook is never sent to players.

The passport service on lsgov.co.uk (`Config.gov.services`, id `passport`) is already switched to live. If `as-passport` is not running the page tells the player it is not available.

## Edit made to as-postalprime (needed for locker delivery)

`as-postalprime` originally only delivered its own catalogue orders. It was edited so other resources can send a parcel to a locker. Changes are in `as-postalprime/server/bridge.lua` and `server/main.lua`, and are documented in the section "Parcels from other resources" of the Postal Prime README:

- New export `createParcel(citizenid, { ref, sender, lockerId, prepSeconds, expireSeconds, items = { { item, label, icon, qty, metadata } } })`. It returns `true`, or `false, reason`. `'busy'` means the player already has an active Postal Prime order, so as-passport tries again on its next 15 second pass.
- New export `getLockers()` returning `{ { id, label } }` for the locker picker.
- New server events `as-postalprime:parcelCollected (citizenid, ref, source)` and `as-postalprime:parcelExpired (citizenid, ref)`. as-passport uses them to save the Files copy and to send the passport again if nobody collects it within `Config.delivery.expireSeconds`.
- `PPBridge.addItem` now passes item metadata, so the passport keeps its number.

## Exports for other scripts (police, MDT, shops)

```lua
exports['as-passport']:hasValidPassport(source_or_citizenid)      -- true / false
exports['as-passport']:getPassport(source_or_citizenid)           -- card table (no photo) or nil
exports['as-passport']:getByNumber('482913776', withPhoto)        -- card table or nil, any status
exports['as-passport']:revokePassport('482913776', 'reason')      -- true if it was cancelled
```

A card is `{ number, first, last, dob, sex, nationality, type, status, issuedAt, validUntil, placeOfIssue, country, countryName, hasPhoto, photo? }`. `status` is `issued`, `expired` or `invalid`. `hasValidPassport` is the check to use for "the passport is the ID card".

`exports['as-passport']:getState(source)` and `apply(source, { type, lockerId })` are used by the government site.

## Languages

Every text the script shows (toasts, emails, phone notifications, the copy saved in the Files app, the Discord log titles and the card labels) lives in `locales/`. English is `locales/en.lua`.

- **Switch language**: set `Config.locale = 'de'` (any file name in `locales/`, without `.lua`) in `config.lua`, then restart the resource. `config.lua` is server only, so the client asks the server which language to use.
- **Add a language**: copy `locales/en.lua` to `locales/<code>.lua`, change `Locales['en']` to `Locales['<code>']`, translate the values only (keep the keys and the `%s` / `%d` placeholders in the same order), then set `Config.locale = '<code>'`. The file is loaded automatically by the `locales/*.lua` line in `fxmanifest.lua`.
- **Missing keys** fall back to English, so a partial translation is fine.
- **Not in the locale files**: text you edit yourself in `config.lua` stays there: `Config.types` labels and descriptions (these are shown on the government website), `Config.mailFrom`, `Config.delivery.sender`, `Config.placeOfIssue`, `Config.countryName`, `Config.nationality` and `Config.documentFolder`. Change those directly. The machine readable lines on the card are data and are not translated, and dates saved by the server (`%d %b %Y`) use the server's own date format. Console and log lines for the admin stay in English.

## Notes

- One application at a time per character. Applications are paid from the bank (`Config.account`); a failed database insert refunds the payment.
- The card can only be opened, or shown to someone, by a player who is carrying an item with that passport number.
- Locker delivery does not need the player to be online. They see the email and notification next time they open their phone.
- Without `as-postalprime` running, or with `Config.delivery.mode = 'inventory'`, the passport is added to the inventory when it is ready, and waits if the player is offline.
