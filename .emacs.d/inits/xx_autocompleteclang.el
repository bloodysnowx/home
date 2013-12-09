;; auto-complete-mode
;; (setq ac-modes (append ac-modes '(objc-mode)))

(setq ac-clang-flags (list "-D__IPHONE_OS_VERSION_MIN_REQUIRED=30200" "-x" "objective-c" "-std=gnu99" "-isysroot" xcode:sdk "-I." "-F.." "-fblocks"))
(require 'auto-complete-config)
(require 'auto-complete-clang)
;;(ac-config-default)
(setq ac-modes (append ac-modes '(objc-mode)))
;;(ac-set-trigger-key "TAB")
;; (setq ac-clang-prefix-header "~/.emacs.d/stdafx.pch")
 (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
(setq clang-completion-flags (list "-Wall" "-Wextra" "-fsyntax-only" "-ObjC" "-std=c99" "-isysroot" "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.0.sdk" "-I." "-F.." "-D__IPHONE_OS_VERSION_MIN_REQUIRED=30200"))
(add-hook 'objc-mode-hook
          (lambda () (setq ac-sources (append '(ac-source-clang-complete
                                                ac-source-yasnippet
                                                ac-source-gtags)
                                              ac-sources))))

;; auto-complete-clang 設定
;;(require 'auto-complete-config)
;;(require 'auto-complete-clang)
;; (ac-config-default)

;;補完キー指定
(ac-set-trigger-key "TAB")
;;ヘルプ画面が出るまでの時間（秒）
(setq ac-quick-help-delay 0.8)

(defun my-ac-cc-mode-setup ()
  ;;tなら自動で補完画面がでる．nilなら補完キーによって出る
  (setq ac-auto-start nil)
  (setq ac-clang-prefix-header "~/.emacs.d/stdafx.pch")
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

  (setq-default ac-sources '(ac-source-abbrev 
			     ac-source-dictionary 
			     ac-source-words-in-same-mode-buffers))
  (add-hook 'c++-mode-hook 'ac-cc-mode-setup)
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)
