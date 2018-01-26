INPUT="$(osascript -e 'Tell application "System Events" to display dialog "Enter Application Name:" default answer ""' -e 'text returned of result' 2>/dev/null)"
if [ $? -ne 0 ]; then
    # The user pressed Cancel
    exit 1 # exit with an error status
elif [ -z "$INPUT" ]; then
    # The user left the project name blank
    osascript -e 'Tell application "System Events" to display alert "You must enter a project name; cancelling..." as warning'
    exit 1 # exit with an error status
fi

INPUTICNS=`echo $INPUT | sed 's/ //g'` 

ICON=`defaults read "/Applications/$INPUT.app/Contents/Info.plist" CFBundleIconFile`
if [[ "$ICON" != *".icns"* ]]; then 
	ICONFINAL="$ICON.icns"
elif  [[ "$ICON" == *".icns"* ]]; then
	ICONFINAL="$ICON"
fi

sips -s format png -Z 250 "/Applications/$INPUT.app/Contents/Resources/$ICONFINAL" --out ~/Desktop/"$INPUT".png
