-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.py" }

-- keymap
lvim.keys.normal_mode["[b"] = ":bp<CR>"
lvim.keys.normal_mode["]b"] = ":bn<CR>"
--
lvim.colorscheme = "catppuccin"

vim.filetype.add({
    pattern = { [".*/hypr/.*%.hl"] = "hyprlang" },
})


--

lvim.plugins = {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg = "none",
                                bg_gutter = "none"
                            }
                        }
                    }
                }
            })
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true
            })
        end
    },
    {
        "HiPhish/info.vim"
    }
}
