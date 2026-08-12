-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "clangd", -- C/C++ (ROS2 nodes)
        "rust-analyzer", -- Rust (ROS2 nodes)
        "pyright", -- Python (ROS2 nodes)
        "cmake-language-server", -- CMakeLists.txt
        "lemminx", -- XML (package.xml, launch files)
        "yaml-language-server", -- params/config YAML

        -- install formatters
        "stylua",
        "clang-format", -- respects a repo's .clang-format
        "black",
        -- rustfmt is not a Mason package; it ships with rustup/rust-analyzer

        -- install debuggers
        "debugpy",
        "codelldb", -- C++ node debugging

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
