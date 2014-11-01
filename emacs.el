(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(setq delete-trailing-lines t)

(define-key global-map (kbd "RET") 'newline-and-indent)

;;tabs are evil, don't want tabs
(setq-default indent-tabs-mode nil)

(setq-default tab-width 2)

(setq-default c-basic-offset 2)
(setq-default css-mode-indent-depth 2)
(setq-default js-indent-level 2)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;if you have auto-complete mode installed
(require 'auto-complete-config)
(ac-config-default)

;;applicable only for emacs 24 and above or if emacs packaging system is present
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
