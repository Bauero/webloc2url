#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title webloc2url
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌍

# Documentation:
# @raycast.description Converts webloc file into url

finderWindowPath=$(osascript <<EOD
if application "Finder" is running and frontmost of application "Finder" then
  tell app "Finder"
    set finderWindow to window 1
    set finderWindowPath to (POSIX path of (target of finderWindow as alias))
    return finderWindowPath
  end tell
else 
  error "Could not get the selected Finder window"
end if
EOD
)

cd $finderWindowPath

#source /Users/piotrbauer/Developer/programy/webloc2url/weblock2url.sh

TEMP_LIST="webloc2url-list.txt.$$.tmp"

find . "(" -name "*.webloc" ")" > $TEMP_LIST

while read p; do

	echo "Found webloc: $p"                        ## $p: ./some/dir/link.webloc
	DIR=$(dirname "${p}")                          ##     ./some/dir
	FILENAME=$(basename "${p}")                    ##     link.webloc
	FILENAME_BASE=$(basename "$FILENAME" .webloc)  ##     link

	TEMP_FILE="$DIR/temp_link.url.$$.tmp"            ## ./some/dir/temp_link.url.2342343.tmp

	FILEPATH_url="${DIR}/${FILENAME_BASE}.url"     ## ./some/dir/link.url

	## remove any "._XY" files - AppleDouble encoded Macintosh file
	## see: http://en.wikipedia.org/wiki/AppleSingle_and_AppleDouble_formats
	dot_clean -m "$DIR"

	LINK=`plutil -convert xml1 -o - "$p" | grep "string" | sed "s/<string>//" | sed "s/<\/string>//" | sed "s/	//"`
	## NOTE: last sed contains a TAB caracter
	echo " - Link is: $LINK"

	#FILEPATH_url_q=$(printf %q "$FILEPATH_url")
	#echo "** FILEPATH_url_q: $FILEPATH_url_q"

	echo " - Create Windows url file"

	echo "[InternetShortcut]" > "${TEMP_FILE}"
	echo "URL=$LINK" >> "${TEMP_FILE}"

	#echo "${TEMP_FILE} -> ${FILEPATH_url}"
	mv "${TEMP_FILE}" "${FILEPATH_url}"

	echo ""

    rm "$p"

done < $TEMP_LIST

rm -f $TEMP_LIST

echo "all done."

## EOF.

exit