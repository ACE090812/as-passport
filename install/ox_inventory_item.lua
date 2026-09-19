-- Add this to ox_inventory/data/items.lua, and put passport.png in ox_inventory/web/images/.
['passport'] = {
    label = 'Passport',
    weight = 50,
    stack = false,          -- every passport is its own item with its own number
    close = true,
    description = 'A passport. Use it to look at it, or show it to the person next to you.',
    client = { event = 'as-passport:client:useItem' },
},
