(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(setq delete-trailing-lines t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq css-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

;;from manage package options you can install various packages like
;; * auto-complete mode
;; * ruby mode
;; * scss-mode
;; * js3-mode
;; * json-mode
;; * csv-mode
;; * yaml-mode
;; * flymake-ruby -- flymake is for syntax checking on the go
;; etc

(add-hook 'ruby-mode-hook 'auto-complete-mode)
