; android-mode
(require 'android-mode)

;; Android SDKのパス
(setq android-mode-sdk-dir "/Applications/Android Studio.app/sdk")

;; コマンド用プレフィックス
;; ここで設定したキーバインド＋android-mode.elで設定された文字、で、各種機能を利用できます
(setq android-mode-key-prefix (kbd "C-c C-c"))

;; デフォルトで起動するエミュレータ名
(setq android-mode-avd "Nexus5")
