-- Customize the startup dashboard (powered by snacks.nvim, bundled with AstroNvim core)
-- This is the "front page" shown when you launch `nvim` with no file argument

-- Animated rainbow header: runs dashboard/lolcat-header.sh in an embedded
-- terminal, cycling lolcat's color offset over dashboard/header.cat
local header_dir = vim.fn.stdpath "config" .. "/dashboard"

local tips = {
  -- editing
  "Tip: `dd` deletes a line, `p` pastes it back",
  'Tip: `ci"` changes text inside quotes, `ci(` inside parens',
  "Tip: `.` repeats your last change",
  "Tip: `u` undoes, `<C-r>` redoes",
  "Tip: `yy` yanks a line, `3yy` yanks 3 lines",
  "Tip: visual block mode is `<C-v>` — great for column edits",
  "Tip: `gcc` toggles a comment on the current line",
  "Tip: `J` joins the line below onto the current one",
  "Tip: `>>`/`<<` indent or unindent a line, `.` repeats it",
  "Tip: `q` + a letter records a macro, `@` + that letter replays it",

  -- navigation
  "Tip: `gd` jumps to a symbol's definition (with LSP attached)",
  "Tip: `gr` lists references to the symbol under the cursor",
  "Tip: `%` jumps between matching brackets",
  "Tip: `*` searches for the word under the cursor",
  "Tip: `<C-o>` / `<C-i>` walk backward/forward through your jump list",
  "Tip: `gg`/`G` jump to the top/bottom of the file",
  "Tip: `zz` centers the cursor line on screen",
  "Tip: `f<char>` jumps to the next `<char>` on the line, `;` repeats it",

  -- search & replace
  "Tip: `<Leader>ff` finds files, `<Leader>fw` finds a word",
  "Tip: `:%s/old/new/g` replaces every match in the file",
  "Tip: `<Leader>fb` fuzzy-finds open buffers",
  "Tip: `<Leader>fh` fuzzy-finds help tags",

  -- buffers & windows
  "Tip: `<Leader>bd` closes the current buffer",
  "Tip: `]b` / `[b` cycle to the next/previous buffer",
  "Tip: `<C-w>s` / `<C-w>v` split the window horizontally/vertically",
  "Tip: `<C-h/j/k/l>` moves between splits",

  -- LSP & diagnostics
  "Tip: `<Leader>la` triggers an LSP code action",
  "Tip: `]d` / `[d` jump to the next/previous diagnostic",
  "Tip: `K` shows hover documentation for the symbol under the cursor",
  "Tip: `<Leader>lr` renames a symbol project-wide via LSP",

  -- git & misc
  "Tip: `<Leader>gt` opens git status via the picker",
  "Tip: `:Lazy sync` installs/updates all plugins",
  "Tip: `:Mason` manages installed LSPs, linters, and formatters",
  "Tip: `<Leader>sh` opens a horizontal terminal split",
}
math.randomseed(os.time())

---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      -- pane_gap: empty columns between the left (art) and right (options) panes
      pane_gap = 6,
      preset = {
        -- AstroNvim's default key list (astronvim/plugins/snacks.lua), plus
        -- two new entries. This fully replaces the default array (lazy.nvim
        -- overwrites array-type opts rather than merging them), so all the
        -- originals are repeated here on purpose.
        keys = {
          { key = "n", action = "<Leader>n", icon = " ", desc = "New File  " },
          { key = "f", action = "<Leader>ff", icon = " ", desc = "Find File  " },
          { key = "o", action = "<Leader>fo", icon = " ", desc = "Recents  " },
          { key = "w", action = "<Leader>fw", icon = " ", desc = "Find Word  " },
          { key = "'", action = "<Leader>f'", icon = " ", desc = "Bookmarks  " },
          { key = "s", action = "<Leader>Sl", icon = " ", desc = "Last Session  " },
          { key = "c", action = "<Leader>fC", icon = " ", desc = "Commands  " },
          { key = "h", action = "<Leader>fh", icon = "󰋖 ", desc = "Help  " },
        },
      },
      sections = {
        -- pane = 1 (left): the animated art, then a random tip underneath it
        {
          section = "terminal",
          pane = 1,
          cmd = header_dir .. "/lolcat-header.sh " .. header_dir .. "/header.cat",
          height = 15,
          width = 61,
          indent = 0,
        },
        {
          pane = 1,
          -- align = "center",
          text = {{tips[math.random(#tips)], hl = "TipText"}},
        },
        -- pane = 2 (right): keys + startup stacked, same as before, just moved over
        { section = "keys", pane = 2, gap = 1, padding = 3 },
        { section = "startup", pane = 2 },
      },
    },
  },
}
