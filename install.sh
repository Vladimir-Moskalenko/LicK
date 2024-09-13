# Made by \/\\\
dir=$PWD

installAquaTheme()
{
if [[ $(csrutil status) = "System Integrity Protection status: enabled." ]]; then
	echo "Disable SIP first!"
	exit 1
fi
sudo echo "SIP disabled, continuing..."

diskutil list
read -p "Find the target drive name in the list above (the one WITHOUT the - Data suffix), then enter the #s# values. Then, type them below: " diskNums

echo creating livemount folder.. 
mkdir ~/lvmnt > /dev/null 2>&1
sudo mount -o nobrowse -t apfs /dev/disk$diskNums ~/lvmnt

cd ~/Desktop
git clone https://github.com/VisualisationExpo/AquaLickX-Sonoma145Edition 

echo Copying Aqua.car
sudo cp AquaLickX-Sonoma145Edition/Aqua.car ~/lvmnt/System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/

echo Copying VibrantLight.car
sudo cp AquaLickX-Sonoma145Edition/VibrantLight.car ~/lvmnt/System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/

echo Copying DarkAqua.car
sudo cp AquaLickX-Sonoma145Edition/DarkAqua.car ~/lvmnt/System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/

echo Copying VibrantDark.car
sudo cp AquaLickX-Sonoma145Edition/VibrantDark.car ~/lvmnt/System/Library/CoreServices/SystemAppearance.bundle/Contents/Resources/

echo Blessing the boot volume
sudo bless --mount ~/lvmnt --bootefi --create-snapshot
sudo bless --mount "$HOME/lvmnt/System/Library/CoreServices/" --setBoot --create-snapshot > /dev/null 2>&1

echo Installation successful! Reboot to apply changes.
}

installSysIcon()
{
	cd $PWD
	echo Installing "$1" icon...
	sudo ./fileicon set ~/lvmnt/System/Applications/"$1".app SystemIcons/"$1".icns
}

installAquaIcons()
{
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
sudo cp SystemIcons/finder.png /System/Library/CoreServices/Dock.app/Contents/Resources/
sudo cp SystemIcons/finder@2x.png /System/Library/CoreServices/Dock.app/Contents/Resources/

echo Installed Finder icon!

sudo bless --mount ~/lvmnt --bootefi --create-snapshot
sudo bless --mount "$HOME/lvmnt/System/Library/CoreServices/" --setBoot --create-snapshot > /dev/null 2>&1

echo Finished installing! Now, reboot to apply.
}


getWallpapers()
{
cd ~/Library/Application\ Support/com.apple.mobileAssetDesktop/
echo Downloading Mac OS X 10.0 wallpaper for 512pixels 
curl https://lmnt.me/archive/wallpapers/apple/quantum-foam/heic/quantum-foam-blue.heic --output Aqua.heic
}


echo This installer supports ONLY macOS Sonoma! It WILL break your system on any other macOS version!
echo
echo To install the theme, type t
echo To get the wallpapers, type w
echo To make a complete installation, type c
echo Any other action will abort.


read -p "	> "  usrInput
echo $usrInput
 
if [ $usrInput = "t" ]; then
	installAquaTheme
fi

if [ $usrInput = "w" ]; then
	echo w
	getWallpapers
fi

if [ $usrInput = "c" ]; then
	getWallpapers
	installAquaTheme
fi

if [ $usrInput = "i" ]; then
	installAquaIcons
fi