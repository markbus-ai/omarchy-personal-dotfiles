return {
  "Exafunction/codeium.vim",
  event = "InsertEnter",
  init = function()
    vim.g.codeium_disable_bindings = 1
  end,
  config = function()
    vim.keymap.set("i", "<Tab>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<C-]>", function()
      return vim.fn["codeium#CycleNext"]()
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<C-[>", function()
      return vim.fn["codeium#CyclePrev"]()
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<C-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true })
  end,
}
