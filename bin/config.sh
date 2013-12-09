defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.NetworkBrowser ShowThisComputer -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false

defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'

