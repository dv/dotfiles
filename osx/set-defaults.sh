# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.
#
# A nice GUI to check settings can be found here:
#   http://apps.tempel.org/PrefsEditor
#

# Enable press-and-hold for keys, removing key repeat, for
# easy accented characters.
defaults write -g ApplePressAndHoldEnabled -bool true

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 1

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Make CMD-V paste without formatting
# defaults write NSGlobalDomain NSUserKeyEquivalents -dict "Paste and Match Style" -string "@v"
defaults write NSGlobalDomain NSUserKeyEquivalents -dict "Paste" -string "@v"

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Make CMD-F in Finder to start "Find by filename"
defaults write com.apple.finder NSUserKeyEquivalents -dict "Find by Name..." -string "@f"

# Make new windows in Finder start up to my home path
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file:///Users/david/"

# Autohide Dock
defaults write com.apple.dock autohide -bool true

# Remove Dock hide/show delay
defaults write com.apple.dock autohide-delay -float 0

# Shorten Dock hide/show animation
defaults write com.apple.dock autohide-time-modifier -float 0.2

# Restart Dock
killall Dock

# Map caps-lock to ctrl (needs restart)
defaults -currentHost write -g com.apple.keyboard.modifiermapping.alt_handler_id-50 -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>"

echo "  Set up OSX settings. Some settings might need a restart to take effect."
