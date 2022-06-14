(module magic.plugin.neorg)

(let [neorg (require :neorg)]
  (neorg.setup {:load {:core.defaults {} 
                       :core.norg.journal {:config {}}}}))
