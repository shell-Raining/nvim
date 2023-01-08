-- Set up nvim-cmp.
local cmp = require("cmp")
local icons = require("utils.icons")
local options = require('core.options')

local duplicate_keywords = {
    -- allow duplicate keywords
    ["vsnip"] = 1,
    ["nvim_lsp"] = 1,
    -- do not allow duplicate keywords
    ["buffer"] = 0,
    ["path"] = 0,
    ["cmdline"] = 0,
    ["cmp_tabnine"] = 0,
    ["vim-dadbod-completion"] = 0,
}

local complete_window_settings = {
    fixed = false,
    min_width = 20,
    max_width = 20,
}

cmp.setup({
    -- Insert or Replace
    confirmation = {
        default_behavior = cmp.ConfirmBehavior.Replace,
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered({
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }),

    },
    mapping = {
        -- ["<cr>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "s", "c" }),
        ["<c-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
        ["<c-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
        ["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-5), { "i", "s", "c" }),
        ["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(5), { "i", "s", "c" }),
        ["<tab>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "s", "c" }),
        ["<c-u>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                ---@diagnostic disable-next-line: unused-local
                for i = 1, 5, 1 do
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                end
            else
                fallback()
            end
        end, { "i", "s", "c" }),
        ["<c-d>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                ---@diagnostic disable-next-line: unused-local
                for i = 1, 5, 1 do
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
            else
                fallback()
            end
        end, { "i", "s", "c" }),
        ["<c-k>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end, { "i", "s", "c" }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" }, -- For vsnip users.
        { name = "path" },
        { name = "cmp_tabnine" },
        { name = "buffer" },
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }),
    formatting = {
        format = function(entry, vim_item)
            local kind = vim_item.kind
            local source = entry.source.name

            vim_item.kind = string.format("%s %s", icons[kind], kind)
            vim_item.menu = string.format("<%s>", string.upper(source))
            -- vim_item.dup = duplicate_keywords[source] or 0

            -- determine if it is a fixed window size
            if complete_window_settings.fixed and vim.fn.mode() == "i" then
                local label = vim_item.abbr
                local min_width = complete_window_settings.min_width
                local max_width = complete_window_settings.max_width
                local truncated_label = vim.fn.strcharpart(label, 0, max_width)

                if truncated_label ~= label then
                    vim_item.abbr = string.format("%s %s", truncated_label, "…")
                elseif string.len(label) < min_width then
                    local padding = string.rep(" ", min_width - string.len(label))
                    vim_item.abbr = string.format("%s %s", label, padding)
                end
            end

            return vim_item
        end,
    },
})

-- cmp.setup.filetype("gitcommit", {
--     sources = cmp.config.sources({
--         { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--         { name = "buffer" },
--     }),
-- })

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }
