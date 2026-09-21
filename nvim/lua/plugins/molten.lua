---@type LazySpec
return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- pin to stable major version
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = true
      vim.g.molten_virt_text_output = true
    end,
  },
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- Konsole 22.08+ supports the kitty graphics protocol
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
    },
  },
}
