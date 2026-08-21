---@type LazySpec
return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- pin to stable major version
    build = ":UpdateRemotePlugins",
    init = function()
      -- image.nvim (inline plot rendering) is not set up here since it needs a
      -- working luarocks toolchain; outputs render as text/virtual text instead
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = true
      vim.g.molten_virt_text_output = true
    end,
  },
}
