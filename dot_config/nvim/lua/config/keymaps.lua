-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Compilar con make y correr el archivo actual con F5
vim.keymap.set('n', '<F5>', function()
  vim.cmd('write') -- Guarda antes de compilar
  local output = vim.fn.expand('%:r')

  -- Abrimos una terminal pequeña abajo, corremos make y si tiene éxito, el binario
  vim.cmd('split | term make && ./' .. output)
end, { desc = "Compilar con make y correr" })
