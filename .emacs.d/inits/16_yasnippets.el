(when (require 'yasnippet nil t)
  (require 'yasnippet)
  (yas--initialize)
  (yas/load-directory "~/.emacs.d/elpa/yasnippet-20121127.25/snippets")
;;  (yas/load-directory "~/.emacs.d/elpa/yasnippet-20121127.25/extras/imported")
  (yas/global-mode 1)
)
