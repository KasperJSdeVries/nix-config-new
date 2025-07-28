---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.auto_install = false
    opts.sync_install = false

    opts.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",    -- Ctrl + Space
        node_incremental = "<C-space>",
        scope_incremental = "<A-space>", -- Alt + Space
        node_decremental = "<bs>",       -- Backspace
      }
    }

    opts.highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }

    opts.indent = {
      enable = true,
    }
  end
}
