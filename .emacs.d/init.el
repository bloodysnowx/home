;; load-path 追加
(let ((default-directory (expand-file-name "~/.emacs.d/lisp")))
 (add-to-list 'load-path default-directory)
 (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
     (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

;;(global-whitespace-mode 1)
(set-default-coding-systems 'utf-8-unix)

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
