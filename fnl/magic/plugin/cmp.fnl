(module magic.plugin.cmp
  {autoload {util magic.util
             nvim aniseed.nvim}})

(set nvim.o.completeopt "menuone,noselect")

(local {: setup
        : mapping
        : visible
        : complete
        :config {: compare : disable}
        :ItemField {:Kind kind :Abbr abbr :Menu menu}
        :SelectBehavior {:Insert insert-behavior :Select select-behavior}
        : event} (util.lazy-require! :cmp))

(fn has-words-before []
    (let [col (- (vim.fn.col ".") 1)
          ln (vim.fn.getline ".")]
        (or (= col 0) (string.match (string.sub ln col col) "%s"))))

(setup { :sources [ {:name :conjure}]
        :experimental {:ghost_text true}
        :window {:documentation {:border :solid} :completion {:border :solid}}
        :sources [{:name :nvim_lsp}
                  {:name :luasnip}
                  {:name :path}
                  {:name :buffer} 
                  {:name :conjure}
                  {:name :copilot}]
        :mapping {:<C-e> (mapping.abort)
                  :<C-n> (mapping (mapping.select_next_item {:behavior insert-behavior}) [:i :s])
                  :<C-p> (mapping (mapping.select_prev_item {:behavior insert-behavior}) [:i :s])
                  :<A-Space> (mapping (fn [fallback]
                                        (if (visible)
                                            (mapping.select_next_item {:behavior insert-behavior})
                                            (has-words-before)
                                            (fallback)))
                                      [:i :s :c])
                  :<S-Tab> (mapping (fn [fallback]
                                     (if (visible)
                                         (mapping.select_prev_item {:behavior insert-behavior})
                                         (fallback)))
                                   [:i :s :c])}})
