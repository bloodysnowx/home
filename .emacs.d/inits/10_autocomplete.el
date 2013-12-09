(setq ac-dir "~/.emacs.d/lisp/auto-complete-1.3.1/")
(add-to-list 'load-path ac-dir)
(setq ac-clang-flags (list "-D__IPHONE_OS_VERSION_MIN_REQUIRED=50000" "-x" "objective-c" "-std=gnu99" "-isysroot" xcode:sdk "-I." "-F.." "-fblocks"))

(setq clang-completion-flags (list "-Wall" "-Wextra" "-fsyntax-only" "-x" "objective-c" "-std=c99" "-isysroot" "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.0.sdk" "-I." "-F.." "-D__IPHONE_OS_VERSION_MIN_REQUIRED=50000" "-fblocks"))
(require 'auto-complete-config)
;; (ac-config-default)
(add-to-list 'ac-dictionary-directories (concat ac-dir "ac-dict/"))
(require 'auto-complete-clang)
(defun my-ac-cc-mode-setup ()
;; 読み込むプリコンパイル済みヘッダ
;;(setq ac-clang-prefix-header "stdafx.pch")
;; 補完を自動で開始しない
(setq ac-auto-start nil)
(setq ac-clang-flags '("-w" "-ferror-limit" "1"))
(setq ac-sources (append '(ac-source-clang-complete
ac-source-yasnippet
ac-source-gtags)
ac-sources)))
(defun my-ac-config ()
(global-set-key "\M-/" 'ac-start)
;; C-n/C-p で候補を選択
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
(add-hook 'ruby-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)
(global-auto-complete-mode t))
 
(my-ac-config)

(ac-set-trigger-key "TAB")
(setq ac-modes (append ac-modes '(objc-mode)))
