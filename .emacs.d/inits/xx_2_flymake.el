(require 'flymake)

(defun flymake-display-err-minibuffer ()
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list 
           (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file (flymake-ler-full-file 
                            (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))

(defun flymake-display-err-minibuffer-safe () 
  (ignore-errors flymake-display-err-minibuffer))

;; エラーが起きた時にflymakeを止める
(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)

;; もともとのパターンにマッチしなかったので追加
(setq flymake-err-line-patterns
 (cons
  '("\\(.+\\):\\([0-9]+\\):\\([0-9]+\\): \\(.+\\)" 1 2 3 4)
  flymake-err-line-patterns))

;; flymake の色
(set-face-background 'flymake-warnline "dark orange")
(set-face-foreground 'flymake-warnline "black")
(set-face-background 'flymake-errline "orange red")
(set-face-foreground 'flymake-errline "black")

(add-hook 'objc-mode-hook
  (lambda ()
    (push '("\\.m$" flymake-simple-make-init) flymake-allowed-file-name-masks)
    (push '("\\.h$" flymake-simple-make-init) flymake-allowed-file-name-masks)
    (define-key objc-mode-map "\C-cd" 'flymake-display-err-minibuf)))
(flymake-mode t)
