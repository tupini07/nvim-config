(module magic.plugin.cmp
  {autoload {nvim aniseed.nvim}})

(set nvim.o.completeopt "menuone,noselect")

(let [(ok? cmp) (pcall require :cmp)]
  (when ok?
    (cmp.setup
      {:sources [{:name :nvim_lsp}
                 {:name :luasnip}
                 {:name :path}
                 {:name :buffer} 
                 {:name :conjure}
                 {:name :copilot}]
       :mapping (cmp.mapping.preset.insert
                  {"<C-b>" (cmp.mapping.scroll_docs -4)
                   "<C-f>" (cmp.mapping.scroll_docs 4)
                   "<C-Space>" (cmp.mapping.complete)
                   "<C-e>" (cmp.mapping.abort)
                   "<C-CR>" (cmp.mapping.confirm {:select true})})})))
