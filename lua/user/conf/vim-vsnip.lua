vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"
vim.g.vsnip_filetypes = {
  javascript = { "typescript" },
  typescript = { "javascript" },
  vue = { "javascript", "typescript" },
}
