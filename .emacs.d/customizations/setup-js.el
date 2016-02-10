;; ;; javascript / html
;; (add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
;; (add-hook 'js-mode-hook 'subword-mode)
;; (add-hook 'html-mode-hook 'subword-mode)
;; (setq js-indent-level 2)
;; (eval-after-load "sgml-mode"
;;   '(progn
;;      (require 'tagedit)
;;      (tagedit-add-paredit-like-keybindings)
;;      (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))


;; ;; coffeescript
;; (add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
;; (add-hook 'coffee-mode-hook 'subword-mode)
;; (add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
;; (add-hook 'coffee-mode-hook
;;           (defun coffee-mode-newline-and-indent ()
;;             (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
;;             (setq coffee-cleanup-whitespace nil)))
;; (custom-set-variables
;;  '(coffee-tab-width 2))

;; enable flychekc with js
;; (require 'flycheck)
;; (add-hook 'js-mode-hook
;;           (lambda  ()  (flycheck-mode t)))

;; ;; Open json files with js-mode
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; ;; After installing js2 mode this is required
;; (add-hook 'js-mode-hook 'js2-minor-mode)
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; (setq js2-highlight-level 3)

;; ;; Setup tern and tern autocomplete
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))

;; ;; tern will autorestart, nice to force reload if tern is messing
;; (defun delete-tern-process ()
;;   (interactive)
;;   (delete-process "Tern"))


;; ;; start js files using js2-mode
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; ;; js2mode for node scripts
;; (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;; ;; enable autocompletion for js2-mode
;; (add-hook 'js2-mode-hook 'ac-js2-mode)

;; ;; enable js2-refactor
;; (require 'js2-refactor)
;; (add-hook 'js2-mode-hook #'js2-refactor-mode)

;; eg. extract function with `C-c C-m ef`.
;; (js2r-add-keybindings-with-prefix "C-c C-m")

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 3)

;; Paredit
(defun my-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))

(add-hook 'js-mode-hook 'my-paredit-nonlisp) ;use with the above function

(require 'flycheck)
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))

;; Tern settings
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; just activate the command delete-tern-process via M-x
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))
