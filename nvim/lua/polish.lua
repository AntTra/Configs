-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Dedicated python host for rplugins (e.g. molten-nvim), separate from project venvs
vim.g.python3_host_prog = vim.fn.expand "~/.local/share/nvim/pynvim-venv/bin/python"
