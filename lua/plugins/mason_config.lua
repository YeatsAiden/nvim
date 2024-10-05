local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup()


local status_ok, mason_lps = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason_lps.setup({
  ensure_installed = {
    "lua_ls", -- lua
    "asm_lsp", -- assembly
    "ts_ls", -- javascript
    "bashls", -- bash
    "clangd", -- C++ and C
    "cmake", -- Cmake
    "tailwindcss", -- Css
    "glslls", -- GLSL
    "html", -- HTML
    "jsonls", -- Json
    "pyright", -- Python
    "rust_analyzer", -- Rust
  }
})

-- LSP shinanigans
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

local capabilities = cmp_lsp.default_capabilities()

lspconfig.lua_ls.setup({capabilities = capabilities})
lspconfig.asm_lsp.setup({capabilities = capabilities})
lspconfig.ts_ls.setup({capabilities = capabilities})
lspconfig.bashls.setup({capabilities = capabilities})
lspconfig.clangd.setup({capabilities = capabilities})
lspconfig.cmake.setup({capabilities = capabilities})
lspconfig.tailwindcss.setup({capabilities = capabilities})
lspconfig.glslls.setup({capabilities = capabilities})
lspconfig.html.setup({capabilities = capabilities})
lspconfig.jsonls.setup({capabilities = capabilities})
lspconfig.pyright.setup({capabilities = capabilities})
lspconfig.rust_analyzer.setup({capabilities = capabilities})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<space>f', function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
--   end,
-- })
