(module magic.plugin.project-nvim
  {autoload {nvim aniseed.nvim
             util magic.util
             wk   which-key}})

(let [(ok? project-nvim) (pcall #(require :project_nvim))]
  (when ok?
    (project-nvim.setup {})

    (wk.register { :p { :name "Project" 
                        :t ["<cmd>NvimTreeToggle<CR>" "Toggle Tree"]}} 
                 { :prefix "<leader>"})))
