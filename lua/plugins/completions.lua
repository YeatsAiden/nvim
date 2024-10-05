local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end


local status_ok, vscode = pcall(require, "luasnip.loaders.from_vscode")
if not status_ok then
  return
end

vscode.lazy_load()

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.

      local status_ok, luasnip = pcall(require, "luasnip")
      if not status_ok then
        return
      end

      luasnip.lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<TAB>'] = cmp.mapping.select_next_item(),
    }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})
