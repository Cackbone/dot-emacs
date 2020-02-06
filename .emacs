;;==============;;
;; Melpa config ;;
;;==============;;

(require 'package)(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                                      (not (gnutls-available-p))))
                         (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
                    (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("855eb24c0ea67e3b64d5d07730b96908bac6f4cd1e5a5986493cbac45e9d9636" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (pretty-mode spaceline-all-the-icons flymd ag company-ghci smart-mode-line ocodo-svg-modelines cmake-mode helm-descbinds scheme-complete nginx-mode dockerfile-mode docker-compose-mode docker auto-package-update rjsx-mode yaml-mode arduino-mode web-mode vue-mode irony haskell-mode js2-mode company flycheck-rust racer rust-mode flycheck all-the-icons-gnus use-package spaceline beacon doom-modeline octicons dracula-theme all-the-icons-ivy neotree doom-themes)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(when (not package-archive-contents)
  (package-refresh-contents))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)



;;=============;;
;; EMACS THEME ;;
;;=============;;

;; Gruvbox theme
(load-theme 'gruvbox-dark-hard t)

;; Beacon mode
(beacon-mode 1)
(setq beacon-color "#9d0006")

;; Remove menu and tool bars
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Linum mode
(require 'linum-relative)
(global-linum-mode t)
(setq linum-format "%4d  ")
(set-face-attribute 'linum nil :background "unspecified-bg")
(set-face-attribute 'linum nil :foreground "#afaf00")

;; Setup font
(set-frame-font "Source Code Pro 11" nil t)

;; Icons mode
(require 'all-the-icons)
(setq all-the-icons-color-icons 11)
(setq inhibit-compacting-font-caches t)

;; Modeline mode
(column-number-mode)
(require 'spaceline)
(require 'spaceline-all-the-icons)
(spaceline-all-the-icons-theme)
(spaceline-toggle-all-the-icons-projectile-off)
(setq spaceline-all-the-icons-separator-type 'slant)


;;===========================;;
;; Emacs file menu (neotree) ;;
;;===========================;;
(require 'neotree)

;; Bind neotree on f8 key
(global-set-key [f8] 'neotree-toggle)

;; Open neotree on emacs startup
(defun neotree-startup ()
  (interactive)
  (neotree-show)
  (call-interactively 'other-window))

(if (daemonp)
    (add-hook 'server-switch-hook #'neotree-startup)
  (add-hook 'after-init-hook #'neotree-startup)
  )

(setq neo-autorefresh 'true)
(setq neo-force-change-root t)

;; Icons
(setq neo-theme (if  'icons 'arrow))
(setq neo-theme (if window-system 'icons 'arrow))


;;=============;;
;; Pretty mode ;;
;;=============;;
(require 'pretty-mode)


;;=============;;
;; WHITESPACES ;;
;;=============;;
(require 'whitespace)
(setq whitespace-display-mappings

      '((space-mark   ?\     [?.]     [?.])
        (newline-mark ?\n    [?◀ ?\n])
        (tab-mark     ?\t    [?\u2502 ?\t] [?\\ ?\t])))
(setq whitespace-style '(face trailing tabs newline tab-mark newline-mark))
(set-face-background 'whitespace-tab "#unspecified-bg")
(set-face-foreground 'whitespace-tab "#2b3c44")
(set-face-background 'whitespace-space "unspecified-bg")
(set-face-foreground 'whitespace-space "#111111")
(set-face-background 'whitespace-newline "unspecified-bg")
(set-face-foreground 'whitespace-newline "#2b3c44")
(global-whitespace-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)



;;=============;;
;; TABS/SPACES ;;
;;=============;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)



;;=========================;;
;; Flycheck syntax checker ;;
;;=========================;;
(global-flycheck-mode)


;;==============;;
;; Company mode ;;
;;==============;;
(add-hook 'after-init-hook 'global-company-mode)



;;======;;
;; RUST ;;
;;======;;

;; Flycheck rust
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Racer mode
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

;; Company mode
(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)



;;=====;;
;; WEB ;;
;;=====;;


;; Front end
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-include-node-externs t)


;; React native
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("screens\\/.*\\.js\\'" . rjsx-mode))



;;========;;
;; Scheme ;;
;;========;;
(add-to-list 'auto-mode-alist '("\\.scheme\\'" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.scm\\'" . scheme-mode))



;;=========;;
;; Haskell ;;
;;=========;;
(require 'company-ghci)
(push 'company-ghci company-backends)
(add-hook 'haskell-mode-hook 'turn-on-pretty-mode)
(add-hook 'haskell-mode-hook 'company-mode)
;;; To get completions in the REPL
(add-hook 'haskell-interactive-mode-hook 'company-mode)



;;==========;;
;; Org mode ;;
;;==========;;
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq inhibit-splash-screen t)
(transient-mark-mode 1)



(provide '.emacs)
