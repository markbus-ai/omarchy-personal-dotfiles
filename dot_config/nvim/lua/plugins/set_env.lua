return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    ft = "python",
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Seleccionar Venv" },
    },
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
  },
}
