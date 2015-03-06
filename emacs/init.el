;;; init.el --- Basic setup file

;;; Commentary:
;; This file downloads the relevant packages and calls
;; there respective setup files

;;; Code:

;; Emacs is not a package manager, and here we load its package manager!
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
("elpa" . "http://tromey.com/elpa/")
;; TODO: Maybe, use this after emacs24 is released
;; (development versions of packages)
("melpa" . "http://melpa.milkbox.net/packages/")
))
  (add-to-list 'package-archives source t))
(package-initialize)

;;; Required packages
;;; everytime Emacs starts, it will automatically check if those packages are
;;; missing, it will install them automatically
(when (not package-archive-contents)
(package-refresh-contents))
   (defvar tmtxt/packages
     '(ess
       elisp-slime-nav
       evil-leader
       smex
       exec-path-from-shell
       haskell-mode
       yasnippet
       auto-complete
       smartparens
       magit
       zenburn-theme
       evil
       quack
       linum-relative
       undo-tree
       flycheck
       clojure-mode
       cider
       ac-cider
       rainbow-delimiters))
     (dolist (p tmtxt/packages)
       (when (not (package-installed-p p))
           (package-install p)))

;; This section set up the dir to load all the setup scripts
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))


;; Start loading in my custom files
(load-user-file "color-theme.el")
(load-user-file "personal.el")
(load-user-file "sp.el")
(load-user-file "r.el")
(load-user-file "clojure.el")
(load-user-file "haskell.el")
(load-user-file "erlang.el")
(load-user-file "scheme.el")
(load-user-file "lisp.el")

;;(load-user-file "scala.el")
;;IMPORTANT TO LOAD EVIL LAST
(load-user-file "slime.el")
(load-user-file "evil-leader.el")
(load-user-file "evil.el")
;;; init.el ends here
