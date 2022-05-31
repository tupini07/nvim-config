(module magic.plugin.orgmode
  {autoload {wk   which-key}})

(let [(ok? orgmode) (pcall #(require :orgmode))]
  (when ok?
    (orgmode.setup_ts_grammar)
    (orgmode.setup {
                    :org_agenda_files ["~/org-files/journal/*"
                                       "~/org-files/notes.org"
                                       "~/org-files/TODOs.org"]
                    :org_default_notes_file "~/org-files/notes.org"})

    (wk.register { :o { :name "Org Mode"
                        :a "Agenda prompt"
                        :c :Capture}} 
                 { :prefix "<leader>"})))
