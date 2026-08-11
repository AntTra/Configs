-- Installs the Tokyo Night colorscheme plugin
-- `priority = 1000` + `lazy = false` ensures it loads before other UI plugins need it

---@type LazySpec
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", -- "storm" | "moon" | "night" | "day"
    transparent = true, -- sets Normal/NormalFloat/sidebar backgrounds to "none"
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
