local translate = require('translate')

translate.setup({
    default = {
        command = "google",
        output = "floating",
        parse_before = "trim",
    },
    replace_symbols = {
        google = {},
        deepl_pro = {},
        deepl_free = {},
        translate_shell = {},
    },
})
