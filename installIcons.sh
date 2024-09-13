# Made by \/\\\
dir=$PWD

installSysIcon()
{
	cd $PWD
	echo Installing "$1" icon...
	sudo ./fileicon set ~/lvmnt/System/Applications/"$1".app SystemIcons/"$1".icns
}

read -p "Find the target drive name in the list above (the one WITHOUT the - Data suffix), then enter the #s# values. Then, type them below: " diskNums
sudo mount -o nobrowse -t apfs /dev/disk$diskNums ~/lvmnt

echo Downloading FileIcon icon changing utility...
curl -O https://raw.githubusercontent.com/mklement0/fileicon/stable/bin/fileicon
chmod +x fileicon 

installSysIcon "App Store"
installSysIcon "Automator"
installSysIcon "Books"
installSysIcon "Calculator"
installSysIcon "Calendar"
installSysIcon "Chess"
installSysIcon "Clock"
installSysIcon "Contacts"
installSysIcon "Dictionary"
installSysIcon "FaceTime"
installSysIcon "Font Book"
installSysIcon "Image Capture"
installSysIcon "Launchpad"
installSysIcon "Mail"
installSysIcon "Messages"
installSysIcon "Mission Control"
installSysIcon "Music"
installSysIcon "Notes"
installSysIcon "Photo Booth"
installSysIcon "Photos"
installSysIcon "Podcasts"
installSysIcon "Preview"
installSysIcon "QuickTime Player"
installSysIcon "Reminders"
installSysIcon "Siri"
installSysIcon "Stickies"
installSysIcon "Stocks"
installSysIcon "System Settings"
installSysIcon "TextEdit"
installSysIcon "Time Machine"
installSysIcon "TV"
installSysIcon "VoiceMemos"
echo Installed icons for /System/Applications

echo Installing Finder icon...
sudo ./fileicon set ~/lvmnt/System/Library/CoreServices/Finder.app SystemIcons/Finder.icns
sudo cp SystemIcons/finder.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources/
sudo cp SystemIcons/finder@2x.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources/

echo Installed Finder icon!

sudo bless --mount ~/lvmnt --bootefi --create-snapshot
sudo bless --mount "$HOME/lvmnt/System/Library/CoreServices/" --setBoot --create-snapshot > /dev/null 2>&1

echo Finished installing!