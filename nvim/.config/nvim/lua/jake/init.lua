-- Set <space> as the leader key
-- j
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("jake.lazy_init")
require("jake.settings")
require("jake.keybindings")
require("jake.theme")
