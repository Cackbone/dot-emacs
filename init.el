
;; Load global config
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name (concat user-emacs-directory "config.org"))))

(provide 'init)
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
    (gitlab-ci-mode scheme-mode beacon-mode rustic gcmh company-lsp dap-mode lsp-ui lsp-mode eww-lnum w3m projectile discord-emacs quelpa fish-mode javap-mode markdown-preview-mode markdown-mode pretty-mode spaceline-all-the-icons flymd ag company-ghci smart-mode-line ocodo-svg-modelines cmake-mode helm-descbinds scheme-complete nginx-mode dockerfile-mode docker-compose-mode docker auto-package-update rjsx-mode yaml-mode arduino-mode web-mode vue-mode irony haskell-mode js2-mode company flycheck-rust racer rust-mode flycheck all-the-icons-gnus use-package spaceline beacon doom-modeline octicons dracula-theme all-the-icons-ivy neotree doom-themes)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
