local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  win = {
    -- don't allow the popup to overlap with the cursor
    no_overlap = true,
    -- width = 1,
    -- height = { min = 4, max = 25 },
    -- col = 0,
    -- row = math.huge,
    -- border = "none",
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
    zindex = 1000,
    -- Additional vim.wo and vim.bo options
    bo = {},
    wo = {
      -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3,                    -- spacing between columns
    align = "left",                 -- align columns left, center or right
  },
  filter = function(mapping)
    -- example to exclude mappings without a description
    -- return mapping.desc and mapping.desc ~= ""
    return true
  end,
  show_help = true,       -- show help message on the command line when the popup is visible
  triggers = {
    { "<leader>", mode = { "n", "v" } },
  }
  -- triggers = {"<leader>"} -- or specify a list manually
}

which_key.add({
  { "<leader>t",  group = "Terminal" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal", mode = "n" },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal Terminal", mode = "n" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical Terminal", mode = "n" },

  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", mode = "n" },
  { "<leader>w", "<cmd>w!<cr>", desc = "Save", mode = "n" },
  { "<leader>q", "<cmd>q!<CR>", desc = "Quit", mode = "n" },
  { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find File", mode = "n" },
  { "<leader>p", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects", mode = "n" },
  { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers", mode = "n" },
  { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer", mode = "n" },

  { "<leader>P",  group = "Packer" },
  {"<leader>Pc", "<cmd>PackerCompile<cr>", desc = "Compile" },
  {"<leader>Pi", "<cmd>PackerInstall<cr>", desc = "Install" },
  {"<leader>Ps", "<cmd>PackerSync<cr>", desc = "Sync" },
  {"<leader>PS", "<cmd>PackerStatus<cr>", desc = "Status" },
  {"<leader>Pu", "<cmd>PackerUpdate<cr>", desc = "Update" },

  { "<leader>g",  group = "Git" },
  {"<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
  {"<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branches" },
  {"<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit" },

  { "<leader>l",  group = "LSP" },
  {"<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  {"<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
  {"<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
  {"<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format" },
  {"<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
  {"<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
  {"<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
  {"<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
  {"<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  {"<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
  {"<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  {"<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  {"<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },

  { "<leader>s",  group = "Search" },
  {"<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  {"<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  {"<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  {"<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  {"<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  {"<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  {"<leader>sg", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Live Grep"},

  { "<leader>d",  group = "DAP" },
  {"<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
  {"<leader>dc", "<cmd>DapContinue<cr>", desc = "Toggle Breakpoint" },
  {"<leader>dp", function() require('dap-python').test_method() end , desc = "Debug Python Run" },
})

which_key.setup(setup)
