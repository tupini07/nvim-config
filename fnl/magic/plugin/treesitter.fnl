(module magic.plugin.treesitter)

(let [config (require :nvim-treesitter.configs)]
  (config.setup {:ensure_installed  [:norg :org]
                 :highlight {:enable true}}))

