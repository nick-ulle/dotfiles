local keymap = vim.keymap

-- Don't set up Tmux Navigator mappings automatically.
vim.g.tmux_navigator_no_mappings = 1

return {
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      keymap.set("n", "<C-w>h", ":TmuxNavigateLeft<cr>", {
        desc = "Navigate left"
      })
      keymap.set("n", "<C-w>j", ":TmuxNavigateDown<cr>", {
        desc = "Navigate down"
      })
      keymap.set("n", "<C-w>k", ":TmuxNavigateUp<cr>", {
        desc = "Navigate up"
      })
      keymap.set("n", "<C-w>l", ":TmuxNavigateRight<cr>", {
        desc = "Navigate right"
      })
    end
  },
  {
    "christoomey/vim-tmux-runner",
    config = function()
      keymap.set("n", "<leader><return>", ":VtrSendLinesToRunner<cr>j", {
        desc = "Send lines to Tmux"
      })
      keymap.set("v", "<leader><return>", ":VtrSendLinesToRunner<cr>`>j", {
        desc = "Send lines to Tmux"
      })
      keymap.set("n", "<leader><tab>", ":VtrAttachToPane<cr>", {
        desc = "Attach to Tmux pane"
      })
    end
  }
}
