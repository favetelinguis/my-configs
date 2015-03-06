;;; evil.el --- Setup for evil mode

;;; Commentary:

;;; Code:
(require 'evil)
(evil-mode 1)

;;; Setup which modes should be used for buffers
(add-to-list 'evil-emacs-state-modes 'haskell-error-mode)
(add-to-list 'evil-emacs-state-modes 'haskell-interactive-mode)
(add-to-list 'evil-emacs-state-modes 'eshell-mode)
(add-to-list 'evil-emacs-state-modes 'erlang-shell-mode)
;;; Custome keybinding insert-state
(define-key evil-insert-state-map (kbd "C-;") 'evil-normal-state)
;;; Custom keybinding normal-state
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
;; Toggle buffers
(define-key evil-normal-state-map (kbd "C-i") 'previous-buffer)
(define-key evil-normal-state-map (kbd "C-o") 'next-buffer)
;;; Custom keybinding normal-state
(define-key evil-emacs-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-emacs-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-emacs-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-emacs-state-map (kbd "C-l") 'evil-window-right)
;; Toggle buffers
(define-key evil-emacs-state-map (kbd "C-i") 'previous-buffer)
(define-key evil-emacs-state-map (kbd "C-o") 'next-buffer)
;; Get documentation with K
(evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
  'elisp-slime-nav-describe-elisp-thing-at-point)

(eval-after-load 'ibuffer
  '(progn
     (evil-set-initial-state 'ibuffer-mode 'normal)
     (evil-define-key 'normal ibuffer-mode-map
       (kbd "j") 'evil-next-line
       (kbd "k") 'evil-previous-line
       (kbd "l") 'ibuffer-visit-buffer
       (kbd "v") 'ibuffer-toggle-marks
     )
   )
 )
(require 'dired-x)
(defun my-dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file."
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)
    ))

(evil-define-key 'normal dired-mode-map "h" 'my-dired-up-directory)
(evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
(evil-define-key 'normal dired-mode-map "o" 'dired-sort-toggle-or-edit)
(evil-define-key 'normal dired-mode-map "v" 'dired-toggle-marks)
(evil-define-key 'normal dired-mode-map "m" 'dired-mark)
(evil-define-key 'normal dired-mode-map "u" 'dired-unmark)
(evil-define-key 'normal dired-mode-map "U" 'dired-unmark-all-marks)
(evil-define-key 'normal dired-mode-map "c" 'dired-create-directory)
(evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
(evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
(evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)

;;; evil.el ends here
