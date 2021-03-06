;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
; (add-to-list 'package-archives
;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
; (add-to-list 'package-archives
;              '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
              '("melpa" . "http://melpa.milkbox.net/packages/") t)

; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;                          ("melpa" . "http://melpa-stable.milkbox.net/packages/")))


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(

    ;; CLOJURE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit
    
    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; autocompletions
    ;; active for lisp and clojure mode
    ;; company ;; try autocomplete for some time
    
    ;; colorful parenthesis matching
    rainbow-delimiters
    
    ;; Javascript and web;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; edit html tags like sexps
    ;; tagedit
    
    ;;javascript mode
    auto-complete
    yasnippet
    flycheck
    
    js2-mode
    ac-js2
    js2-refactor
    react-snippets
    web-beautify
    tern
    tern-auto-complete
    
    web-mode
    emmet-mode
    ac-emmet
    
    
    ;; major mode for editing markdown files
    markdown-mode
    json-mode
    
    ;; Base setup ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; display ido in vertical mode
    ido-vertical-mode
    
    ;; enables silver seracher for emacs requires ag for linux
    ag

    ;; shows avaliable keys for set prefixes
    guide-key

    ;; undo-tree is required for evil mode
    undo-tree

    ;; evil mode to emulate vim
    evil
    
    ;; easy way to comment text with gcc
    evil-commentary
    
    ;; port of vim surround
    evil-surround
    
    ;; needed not for evil-surround to fuck up paredits surroundings
    evil-paredit

    ;; use % to jump between matching tags
    evil-matchit
    
    ;; Sets relative line numbers
    linum-relative
        
    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; git integration
    magit
    ))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")
(load "init-evil.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-markdown.el")
(load "setup-web.el")

;; Settings for the IRC client in Emacs
(load "erc-setup.el")
