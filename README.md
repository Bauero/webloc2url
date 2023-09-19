# webloc2url-raycast-script
**BACKSTORY**
I was frustrated with the way you create webpage link on Mac (why tf. they can't just be normal and use URL??? 😠) - Anyway, I've begin serching web and stumble upon this repository:
https://github.com/anonymousaga/webloc-to-url-mac-app (change webloc to url with GUI)
which lead me to the original work of [https://github.com/flagsoft|flagsoft]:
https://github.com/flagsoft/webloc2url.

This simple bash script, quickly and efficiently searches through any directory in which you're currently are, serching it recursivly to creates new files with the correct (ekhm. URL) file format. 

## Why I've made this?
Inspired by https://www.raycast.com/shubzkothekar/open-in-visual-studio-code extension (can be found on git under this link: https://github.com/raycast/extensions/tree/4978a558a7bf210f3f3e503f5d37beaf3ef9af8c/extensions/open-in-visual-studio-code) , I've decided to create a similar solution, which can be executed in current active folder

## How should/does it work?
While being in 


## Example Usage
```
cd ./top_path_to_webloc_dir/
bash ./webloc2url.sh
```

## Example Run
```
michi@OSX ~/DATA/Prj/webloc2url $ bash ./webloc2url.sh 

webloc2url.sh Copyright (C) 2015 by mzm
This program comes with ABSOLUTELY NO WARRANTY; for details see file LICENSE.
This is free software, and you are welcome to redistribute it
under certain conditions; see file LICENSE for details.

Found webloc: ./testing/website-link-mac.webloc
 - Link is: http://www.google.com
 - Create Windows url file

all done.
michi@OSX ~/DATA/Prj/webloc2url $ 
```

File ./testing/website-link-mac.webloc has been convertet to ./testing/website-link-mac.url.

# UI - User Interface
https://github.com/anonymousaga made a UI with AppleScript. Not testet by myself.
"I made a GUI for your app using applescript. I built it as an alternative in-an-out converter instead of finding and creating. I wanted to make sure you received credit for the real work of my app - the converting. Here is the app: https://github.com/anonymousaga/webloc-to-url-mac-app/"

