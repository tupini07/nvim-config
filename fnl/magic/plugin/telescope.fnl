(module magic.plugin.telescope
  {autoload {nvim aniseed.nvim
             util magic.util
             wk   which-key}})

(let [(ok? telescope) (pcall #(require :telescope))]
  (when ok?
    (telescope.setup
      {:defaults
       {:vimgrep_arguments ["rg" "--color=never" "--no-heading"
                            "--with-filename" "--line-number" "--column"
                            "--smart-case" "--hidden" "--follow"
                            "-g" "!.git/"]}})

    (telescope.load_extension :projects)

    (wk.register { :f { :name "Folds/Files"
                        ;:i ["<cmd>e ~/.config/nvim/fnl/magic/init.fnl <cr><cmd>cd ~/.config/nvim/ <cr>"] 
                        :i ["<cmd>e ~/.config/nvim/fnl/magic/init.fnl <cr>" 
                            "Edit init"]}} 
                 { :prefix "<leader>"})

    (util.lnnoremap :fs "w")
    (util.lnnoremap :fF "Telescope find_files hidden=true")
    (util.lnnoremap :ff "Telescope find_files hidden=false")
    (util.lnnoremap :f- "Telescope file_browser")
    (util.lnnoremap :fp "Telescope projects")
    (util.lnnoremap :fg "Telescope live_grep")
    (util.lnnoremap :* "Telescope grep_string")
    (util.lnnoremap :fb "Telescope buffers")
    (util.lnnoremap :fH "Telescope help_tags")
    (util.lnnoremap :fm "Telescope keymaps")
    (util.lnnoremap :fM "Telescope marks")
    (util.lnnoremap :fh "Telescope oldfiles")
    (util.lnnoremap :ft "Telescope filetypes")
    (util.lnnoremap :fc "Telescope commands")
    (util.lnnoremap :fC "Telescope command_history")
    (util.lnnoremap :fq "Telescope quickfix")
    (util.lnnoremap :fl "Telescope loclist")
    (util.lnnoremap :fua "Telescope lsp_code_actions")
    (util.lnnoremap :fui "Telescope lsp_implementations")
    (util.lnnoremap :fur "Telescope lsp_references")
    (util.lnnoremap :fuS "Telescope lsp_document_symbols")
    (util.lnnoremap :fus "Telescope lsp_workspace_symbols")))

