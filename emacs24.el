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
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(setq css-indent-offset 2)


;;from manage package options you can install various packages like
;; * company-mode
;; * ruby mode
;; * scss-mode
;; * json-mode
;; * csv-mode
;; * yaml-mode
;; * rjsx-mode -- react files
;; * js2-mode -- ES6 mode
;; * js2-refactor - ES mode
;; * rubocop
;; * flycheck
;; * yasnippet
;; * yasnippet-snippets
;; etc
;;
;; To ensure that flycheck detects rubocop, start emacs from you working directory
;; emacs &
;;
;; use rjsx-mode for .js files
(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)

;; This code looks for a node_modules directory in any parent of the buffer's
;; directory and configures Flycheck to use an eslint executable from that
;; directory if any exists.

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; turn on company mode globally
(add-hook 'after-init-hook 'global-company-mode)


(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)


;; git clone git@github.com:ssinghi/react-es6-snippets-emacs ~/.emacs.d/react-es6-snippets
;; (add-to-list 'load-path "~/.emacs.d/react-es6-snippets")
;; (require 'react-es6-snippets)
