vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { silent = true })
vim.keymap.set({ "n", "v", "o" }, "j", "k")
vim.keymap.set({ "n", "v", "o" }, "k", "j")

vim.opt.spelllang = "en_us"

vim.keymap.set("n", "<leader>ts", "<cmd>set spell!<CR>", {
    desc = "Toggle spell check",
})

vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", {
  desc = "Markdown Preview",
})

-- Writing Mode
local writing_mode = false

vim.keymap.set("n", "<leader>w", function()
  writing_mode = not writing_mode

  if writing_mode then
    require("lazy").load({ plugins = { "vim-pencil", "twilight.nvim" } })
vim.cmd("Pencil")
vim.cmd("TwilightEnable")    vim.cmd("set spell")

    print("Writing mode enabled")
  else
    vim.cmd("PencilOff")
    vim.cmd("TwilightDisable")
    vim.cmd("set nospell")

    print("Writing mode disabled")
  end
end, {
  desc = "Toggle writing mode",
})

-- Plugins
require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },

{
  "folke/twilight.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
  }
},

{
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_theme = "dark"
  end,
},

{
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup()
  end,
},

{
  "preservim/vim-pencil",
  ft = { "markdown", "text" },
  init = function()
    vim.g["pencil#wrapModeDefault"] = "soft"
  end,
},

   {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("kanagawa")

    vim.api.nvim_set_hl(0, "SpellBad", {
  fg = "#e46876",
  underline = true,
})

vim.api.nvim_set_hl(0, "SpellCap", {
  fg = "#7e9cd8",
  underline = true,
})

vim.api.nvim_set_hl(0, "SpellLocal", {
  fg = "#98bb6c",
  underline = true,
})

vim.api.nvim_set_hl(0, "SpellRare", {
  fg = "#ffa066",
  underline = true,
})
  end,
},

{
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = true,
      },
    },
  },
})
