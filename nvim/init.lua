-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Make esc leave edit mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
