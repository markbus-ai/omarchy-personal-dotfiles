local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- 1. Importar el framework core de LazyVim
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- 2. EXTRAS: Estos habilitan el modo "IDE" para Python y AI
    { import = "lazyvim.plugins.extras.lang.python" }, -- LSP (pyright), Linter/Formatter (ruff) y Debugger
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.cmake" },
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.ai.codeium" }, -- IA para autocompletado (reemplaza al codeium.vim manual)
    { import = "lazyvim.plugins.extras.ui.edgy" }, -- Organiza mejor las ventanas del IDE
    { import = "lazyvim.plugins.extras.formatting.prettier" }, -- Útil para tus proyectos web (JSON, YAML, etc.)

    -- 3. Cargar tus configuraciones personalizadas de la carpeta lua/plugins/
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- --- CUSTOM CONFIGS (Tus funciones personalizadas) ---

-- Shebang automático para .sh
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.sh",
  command = "silent! execute 'normal! i#!/bin/bash'",
})

-- Atajo para ejecutar Python (F5) - Ideal para tus bots y scripts de FastAPI
-- Guarda el archivo y lo corre en una terminal dividida
vim.keymap.set("n", "<F5>", ":w<CR>:split | term python3 %<CR>", { desc = "Ejecutar Python" })
