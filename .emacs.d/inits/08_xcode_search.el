(defun region-string-or-currnet-word ()
  "Get region string if region is set, else get current word."
  (if mark-active
      (buffer-substring (region-beginning) (region-end))
    (current-word)))

(defun xcode:searchdoc ()
  (interactive)
  (let ((term (region-string-or-currnet-word)))
    (do-applescript
     (format
      (concat
       "tell application \"System Events\" \r"
       "  tell process \"Xcode\" \r"
                                        ; -- Activate Xcode if necessary
       "    set frontmost to true \r"
                                        ;    -- Open the Organizer
       "    keystroke \"2\" using {shift down, command down} \r"
       "    set organizer to window 1 \r"
                                        ;    -- Select the Documentation panel if it's not already selected
       "    if the title of organizer is not \"Organizer - Documentation\" then \r"
       "      click button \"Documentation\" of tool bar 1 of organizer \r"
       "      delay 0.1 \r"
       "      set organizer to window 1 \r"
       "    end if \r"
                                        ;    -- Move focus to the search field
       "    set searchField to text field 1 of splitter group 1 of organizer \r"
       "    set searchField's focused to true \r"
       "    set value of searchField to \"" term "\" \r"
       "  end tell \r"
       "end tell \r"
       )))))

(add-hook 'objc-mode-hook (lambda ()
  (define-key objc-mode-map (kbd "C-c r") 'xcode:searchdoc)))
