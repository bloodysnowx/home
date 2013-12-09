;; flymake エラー表示は参考程度に・・・
(require 'flymake)
;(defvar flymake-objc-compiler (concat xcode:sdkpath "/usr/bin/clang"))
(defvar flymake-objc-compiler (executable-find "clang"))
(defvar flymake-objc-compile-default-options (list "-Wreturn-type" "-Wparentheses" "-fsyntax-only" "-x" "objective-c" "-std=c99" "-Wswitch" "-Wno-unused-parameter" "-Wunused-variable" "-Wunused-value" "-D__IPHONE_OS_VERSION_MIN_REQUIRED=50000" "-fobjc-arc" "-fblocks" "-isysroot" xcode:sdk))
;;(defvar flymake-objc-compile-default-options (list "-D__IPHONE_OS_VERSION_MIN_REQUIRED=50000" "-fsyntax-only" "-fno-color-diagnostics" "-fobjc-arc" "-fblocks" "-Wreturn-type" "-Wparentheses" "-Wswitch" "-Wno-unused-parameter" "-Wunused-variable" "-Wunused-value" "-isysroot" xcode:sdk))
(defvar flymake-last-position nil)
(defcustom flymake-objc-compile-options '("-I.")
  "Compile option for objc check."
  :group 'flymake
  :type '(repeat (string)))

(defun flymake-objc-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
                    'flymake-create-temp-inplace))
        (local-file (file-relative-name
                     temp-file
                     (file-name-directory buffer-file-name))))
   (list flymake-objc-compiler (append flymake-objc-compile-default-options flymake-objc-compile-options (list local-file)))))

(setq flymake-err-line-patterns
      (cons
       '("\\(.+\\):\\([0-9]+\\):\\([0-9]+\\): \\(.+\\)" 1 2 3 4)
       flymake-err-line-patterns))

(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  ;(setq flymake-check-was-interrupted t)
  ;; dirty hack.... for clang command always exit with status code 1
  (setq exit-status 0))

(add-hook 'objc-mode-hook
         (lambda ()
           (ad-activate 'flymake-post-syntax-check)
           ;; 拡張子 m と h に対して flymake を有効にする設定 flymake-mode t の前に書く必要があります
           (push '("\\.m$" flymake-objc-init) flymake-allowed-file-name-masks)
           (push '("\\.h$" flymake-objc-init) flymake-allowed-file-name-masks)
           (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
               (flymake-mode t))))
