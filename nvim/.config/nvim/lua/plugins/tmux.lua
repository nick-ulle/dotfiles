return {
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      vim.g.tmux_navigator_no_mappings = 1
      vim.keymap.set("n", "<C-w>h", ":TmuxNavigateLeft<cr>")
      vim.keymap.set("n", "<C-w>j", ":TmuxNavigateDown<cr>")
      vim.keymap.set("n", "<C-w>k", ":TmuxNavigateUp<cr>")
      vim.keymap.set("n", "<C-w>l", ":TmuxNavigateRight<cr>")
    end
  },
  {
    "christoomey/vim-tmux-runner",
    config = function()
      vim.keymap.set("n", "<leader><return>", ":VtrSendLinesToRunner<cr>j")
      vim.keymap.set("v", "<leader><return>", ":VtrSendLinesToRunner<cr>`>j")
      vim.keymap.set("n", "<leader><tab>", ":VtrAttachToPane<cr>")
    end
  }
}
