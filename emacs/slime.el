;;; slime.el --- Setting up slime related stuff

;;; Commentary:

;;; Code:
(require 'elisp-slime-nav)

(defun my-lisp-hook ()
  "Activate nav mode in elisp."
  (elisp-slime-nav-mode)
  (turn-on-eldoc-mode)
  )
(add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)

;;; slime.el ends here
