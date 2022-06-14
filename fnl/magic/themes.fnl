(module magic.themes
  {autoload {nvim aniseed.nvim}})

(local theme-configs {:material (fn []
                                  (let [(ok? material) (pcall #(require :material))]
                                    (when ok?
                                      (material.setup
                                        {:custom_highlights {:FloatBorder "#1A1A1A"}
                                         :borders true
                                         :high_visibility {:darker true}})
                                      (set nvim.g.material_style :palenight))))
                      :tokyonight (fn []
                                    (set vim.g.tokyonight_style :storm)
                                    (set vim.g.tokyonight_italic_functions true)
                                    (set vim.g.tokyonight_sidebars [:qf :vista_kind :terminal :packer])
                                    (set vim.g.tokyonight_colors {:hint :orange
                                                                  :error "#ff0000"}))})
(defn setup-theme [theme-name]
  (let [config-fn (?. theme-configs theme-name)]
    (when (= nil config-fn)
      (error (.."Provided theme name '" theme-name "' is not known!")))
    (config-fn)
    (nvim.ex.colorscheme theme-name)))


(setup-theme :tokyonight)
