ICON=`defaults read "/Applications/$INPUT/Contents/Info.plist" CFBundleIconFile`
if [[ "$ICON" != *".icns"* ]]; then 
  ICONFINAL="$ICON.icns"
elif  [[ "$ICON" == *".icns"* ]]; then
  ICONFINAL="$ICON"
fi

for INPUT in "$(ls /Applications | grep -v '"App Store.app\|Notes.app\|Automator.app\| \
OmniGraffle.app\|Calculator.app\|Photo Booth.app\|Calendar.app\|Photos.app\|Chess.app\| \
Preview.app\|Contacts.app\|QuickTime Player.app\|DVD Player.app\|Reminders.app\| \
Dashboard.app\|Safari.app\|Dictionary.app\|Self Service.app\|FaceTime.app\|Siri.app\|\ 
Font Book.app\|Stickies.app\|Image Capture.app\|System Preferences.app\|Install macOS High Sierra.app\| \
TextEdit.app\|Launchpad.app\|Time Machine.app\|Mail.app\|Utilities\|Maps.app\|iBooks.app\|Messages.app\| \
iTunes.app\|Mission Control.app"' )" # | grep -v '"App Store.app\|Mission Control.app"')"
do 
sips -s format png -Z 250 "/Applications/$INPUT/Contents/Resources/$ICONFINAL" --out ~/Desktop/"$ENDICON".png
done
