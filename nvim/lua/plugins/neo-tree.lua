-- Customize Neo-tree (AstroNvim's default file explorer, toggled with <Leader>e)

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "left",
      width = 32,
    },
    filesystem = {
      -- AstroNvim's default is "open_current" (hijacks the directory buffer
      -- in whatever window you opened it in, e.g. fullscreen on `nvim .`).
      -- "open_default" instead opens it as a proper docked sidebar, using
      -- the `window.position`/`width` above — the VSCode-style layout.
      hijack_netrw_behavior = "open_default",
      filtered_items = {
        visible = true, -- show dotfiles/hidden files by default (toggle with `H`)
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = { enabled = true }, -- auto-reveal the open file in the tree
    },
  },
}
