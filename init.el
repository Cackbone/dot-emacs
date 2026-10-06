;;; init.el --- load the literate config  -*- lexical-binding: t; -*-
;; Goes in ~/.emacs.d/init.el (a copy or a symlink). The config itself is README.org, as
;; ~/.emacs.d/config.org; it's tangled to config.el when it changes.

;; M-x customize writes to custom.el, not here
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file nil t))

;; Load global config
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name (concat user-emacs-directory "config.org"))))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
