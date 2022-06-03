(module magic.init
  {autoload {plugin magic.plugin
             nvim   aniseed.nvim
             wk     which-key}
   require-macros [magic.macros]})

;;; Introduction

;; Aniseed compiles this (and all other Fennel files under fnl) into the lua
;; directory. The init.lua file is configured to load this file when ready.

;; We'll use modules, macros and functions to define our configuration and
;; required plugins. We can use Aniseed to evaluate code as we edit it or just
;; restart Neovim.

;; You can learn all about Conjure and how to evaluate things by executing
;; :ConjureSchool in your Neovim. This will launch an interactive tutorial.


;;; Generic configuration

(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)

(nvim.ex.set :spell)
(nvim.ex.set :list)

;;; Mappings

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")
(set nvim.g.rainbow_active 1)

;;; Plugins

;; Run script/sync.sh to update, install and clean your plugins.
;; Packer configuration format: https://github.com/wbthomason/packer.nvim
(plugin.use
  :Olical/aniseed {}
  :Olical/conjure { :mod :conjure}
  :Olical/nvim-local-fennel {}
  :PeterRincker/vim-argumentative {}
  :airblade/vim-gitgutter {}
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  :folke/which-key.nvim {:mod :which-key}
  :ggandor/lightspeed.nvim {}
  :guns/vim-sexp {:mod :sexp}
  :hrsh7th/nvim-compe {:mod :compe}
  :lewis6991/impatient.nvim {}
  :liuchengxu/vim-better-default {:mod :better-default}
  :marko-cerovac/material.nvim {:mod :material}
  :mbbill/undotree {:mod :undotree}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :ahmedkhalf/project.nvim {:mod :project-nvim}
  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  :radenling/vim-dispatch-neovim {}
  :tami5/compe-conjure {}
  :tpope/vim-abolish {}
  :tpope/vim-commentary {}
  :tpope/vim-dispatch {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  :w0rp/ale {:mod :ale}
  :wbthomason/packer.nvim {}
  :janet-lang/janet.vim {}
  :eraserhd/parinfer-rust {}
  :luochen1990/rainbow {}
  :nvim-treesitter/nvim-treesitter {}
  :nvim-orgmode/orgmode {:mod :orgmode}
  :kyazdani42/nvim-web-devicons {}
  :kyazdani42/nvim-tree.lua { :mod :nvim-tree}
  :folke/trouble.nvim {:config (fn [] (let [trouble (require :trouble)] 
                                        (trouble.setup)))}
  :folke/todo-comments.nvim {:requires [[:nvim-lua/plenary.nvim]]
                             :config (fn []
                                       (let [todo-comments (require :todo-comments)]
                                         (todo-comments.setup)))})

;;; Common config

;; TODO: separate the below into different files?
;;; Keymaps
;; easier command line mode
(wk.register {";" [":" "vim-ex"]})

(wk.register {:jk ["<esc>" "Exit to normal mode"]} {:mode :i})

(wk.register {:t { :name "Tabs"
                   :c ["<cmd>tabnew<cr>" "Create tab"]
                   :n ["<cmd>tabnext<cr>" "Next tab"]
                   :p ["<cmd>tabNext<cr>" "Previous tab"]
                   :q ["<cmd>tabclose<cr>" "Close current tab"]}
              :b { :name "Buffers" 
                   "[" ["<cmd>bprevious<cr>" "Previous buffer"]
                   "]" ["<cmd>bnext<cr>" "Next buffer"]}}
             { :prefix "<leader>"})

;;; Some custom commands
(command! Scratch "new | setlocal bt=nofile bh=wipe nobl noswapfile")
(command! SetScratch "edit [Scratch] | setlocal bt=nofile bh=wipe nobl noswapfile")


