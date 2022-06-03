(module magic.plugin.conjure
  {autoload {wk   which-key}
   require-macros [magic.macros]})


(let [(ok? conjure) (pcall #(require :conjure))]
  (when ok?
    ;; visual mode mappings
    (wk.register { :c { :name "Conjure"
                        :E (execute-keys-wk-cmd! "Evaluate current selection" ",E")}} 
                 { :prefix "<leader>"
                   :mode :v})

    ;; normal mappings
    (wk.register { :c { :name "Conjure"
                        :l { :name "Log Buffer"
                             :s (execute-keys-wk-cmd! "Open in horizontal split" ",ls")
                             :v (execute-keys-wk-cmd! "Open in vertical split" ",lv")
                             :t (execute-keys-wk-cmd! "Open in new tab" ",lt")
                             :e (execute-keys-wk-cmd! "Open in current window" ",le")
                             :q (execute-keys-wk-cmd! "Close all log buffers" ",lq")
                             :r (execute-keys-wk-cmd! "(soft) Clear log buffer" ",lr")
                             :R (execute-keys-wk-cmd! "(hard) Clear log buffer" ",lR")
                             :l (execute-keys-wk-cmd! "Set cursor on top of last evaluation" ",ll")}
                        :e { :name "Evaluate" 
                             :e (execute-keys-wk-cmd! "Evaluate current form" ",ee")
                             :E (execute-keys-wk-cmd! "Evaluate current form to comment" ",ece")
                             :r (execute-keys-wk-cmd! "Evaluate root form" ",er")
                             :R (execute-keys-wk-cmd! "Evaluate root form to comment" ",ecr")
                             :w (execute-keys-wk-cmd! "Evaluate word" ",ew")
                             :W (execute-keys-wk-cmd! "Evaluate word to comment" ",ecw")
                             :! (execute-keys-wk-cmd! "Evaluate current form and replace with result" ",e!")
                             :b (execute-keys-wk-cmd! "Evaluate current buffer" ",eb")}
                        :g { :name "Go to" 
                             :d (execute-keys-wk-cmd! "Go to definition" ",gd")}
                        :K (execute-keys-wk-cmd! "Lookup documentation" "K")}}
                 { :prefix "<leader>"
                   :mode :n})))
