(add-to-list 'auto-mode-alist '("\\.mm?$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))

(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))
