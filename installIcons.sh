# Made by \/\\\
dir=$PWD

installSysIcon()
{
	cd $PWD
	echo Installing "$1" icon...
	sudo ./fileicon set ~/lvmnt/System/Applications/"$1".app SystemIcons/"$1".icns
}

installSysUtil()
{
	cd $PWD
	echo Installing "$1" icon...
	sudo ./fileicon set ~/lvmnt/System/Applications/Utilities/"$1".app SystemUtils/"$1".icns
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

installSysUtil "Activity Monitor"
installSysUtil "AirPort Utility"
installSysUtil "Audio MIDI Setup"
installSysUtil "Bluetooth File Exchange"
installSysUtil "Boot Camp Assistant"
installSysUtil "ColorSync Utility"
installSysUtil "Console"
installSysUtil "Digital Color Meter"
installSysUtil "Disk Utility"
installSysUtil "Grapher"
installSysUtil "Keychain Access"
installSysUtil "Migration Assistant"
installSysUtil "Screen Sharing"
installSysUtil "Screenshot"
installSysUtil "System Information"
installSysUtil "Terminal"
installSysUtil "VoiceOver Utility"
echo Installed icons for /System/Applications/Utilites

sudo ./fileicon set ~/lvmnt/System/Library/CoreServices/Finder.app SystemIcons/Finder.icns
sudo cp SystemIcons/finder.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources/
sudo cp SystemIcons/finder@2x.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources/
echo Installed Finder icon!

sudo cp SystemAssets/FibreChannelHD.icns ~/lvmnt/System/Library/Extensions/IOSCSIArchitectureModelFamily.kext/Contents/Resources
sudo cp SystemAssets/FireWireHD.icns ~/lvmnt/System/Library/Extensions/IOSCSIArchitectureModelFamily.kext/Contents/Resources
sudo cp SystemAssets/Removable.icns ~/lvmnt/System/Library/Extensions/IOSCSIArchitectureModelFamily.kext/Contents/Resources
sudo cp SystemAssets/SASHD.icns ~/lvmnt/System/Library/Extensions/IOSCSIArchitectureModelFamily.kext/Contents/Resources
sudo cp SystemAssets/SCSIParallelHD.icns ~/lvmnt/System/Library/Extensions/IOSCSIArchitectureModelFamily.kext/Contents/Resources
sudo cp SystemAssets/USBHD.icns ~/lvmnt/System/Library/Extensions/IOSCSIArchitectureModelFamily.kext/Contents/Resources
echo Installed removable media icons!

sudo cp SystemAssets/trashempty.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources
sudo cp SystemAssets/trashempty2.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources
sudo cp SystemAssets/trashempty@2x.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources
sudo cp SystemAssets/trashempty2@2x.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources
sudo cp SystemAssets/trashfull.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources
sudo cp SystemAssets/trashfull2.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources
sudo cp SystemAssets/trashfull@2x.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources
sudo cp SystemAssets/trashfull2@2x.png ~/lvmnt/System/Library/CoreServices/Dock.app/Contents/Resources
echo Installed trash icons!
echo "And look at that gorgeous trash can. You won't believe how much time we spent crafting a trash can"
echo "    - Craig Federighi, WWDC14"

sudo cp SystemAssets/External.icns ~/lvmnt/System/Library/Extensions/IOStorageFamily.kext/Contents/Resources

sudo bless --mount ~/lvmnt --bootefi --create-snapshot
sudo bless --mount "$HOME/lvmnt/System/Library/CoreServices/" --setBoot --create-snapshotfsf

echo Finished installing!