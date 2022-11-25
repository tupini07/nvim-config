(module magic.plugin.treesitter)

(let [config (require :nvim-treesitter.configs)]
  (config.setup {:ensure_installed  [:norg
                                     :org
                                     :python
                                     :lua
                                     :bash
                                     :elixir
                                     :fennel
                                     :go]
                 :highlight {:enable true}
                 :indent {:enable true}
                 :refactor {:highlight_definitions {:enable true
                                                    :clear_on_cursor_move true}
                            :highlight_current_scope {:enable true}
                            :smart_rename {:enable true
                                           :keymaps {:smart_rename "grr"}}
                            :navigation {:enable true
                                         :keymaps {:goto_definition "gnd"
                                                   :list_definitions "gnD"
                                                   :list_definitions_toc "gO"
                                                   :goto_next_usage "<a-*>"
                                                   :goto_previous_usage "<a-#>"}}}}))




