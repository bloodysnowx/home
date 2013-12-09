;; グループ化せずに*scratch*以外のタブを表示
(tabbar-mode)

;; Firefoxライクなキーバインドに
(global-set-key [(control tab)]       'tabbar-forward)
(global-set-key [(control shift tab)] 'tabbar-backward)

;; 左に表示されるボタンを無効化
(setq tabbar-home-button-enabled "")
(setq tabbar-scroll-left-button-enabled "")
(setq tabbar-scroll-right-button-enabled "")
(setq tabbar-scroll-left-button-disabled "")
(setq tabbar-scroll-right-button-disabled "")
