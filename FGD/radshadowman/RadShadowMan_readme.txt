Program created by Scott https://steamcommunity.com/id/523563476435234/

This program will automatically generate a .rad file with the mapname and add instances of "forcetextureshadow" for every prop in the specified vmf.

It will currently create an entry for every model regaurdless of whether or not it is translucent/alphatested


Command line usage is as Follows
RadShadowMan.exe "input"

To use this in Hammer,
-Extract the program wherever you like.
-Go to "Expert Mode" if you aren't already using it.
-Click "new" and move the newly created command to the top of the list.
-Click "Cmds" then "Executable" and browse to wherever you extracted the program.
-Under Parameters, simply add "$path\$file.vmf" without quotes.
-You can then run the stack and never have to worry about texture shadow entrys again.
