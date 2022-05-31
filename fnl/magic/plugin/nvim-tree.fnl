(module magic.plugin.nvim-tree
  {autoload {nvim aniseed.nvim
             util magic.util
             wk   which-key}})

(let [(ok? nvim-tree) (pcall #(require :nvim-tree))]
  (when ok?
    (nvim-tree.setup {
                      :update_cwd true
                      :respect_buf_cwd true
                      :update_focused_file {:enable true
                                            :update_cwd true}})

    (wk.register { :p { :name "Project" 
                        :t ["<cmd>NvimTreeToggle<CR>" "Toggle Tree"]}} 
                 { :prefix "<leader>"})))
