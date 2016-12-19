#!/bin/sh

#lynx is required to run this script

wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
echo "Online"

else

echo "offline"

zenity --warning \
--title="Update | Network Error" \
--text="It appears as though you are not connected to the internet." \
--ok-label="OK"
fi

(
echo "10" ; sleep .1
echo "# Checking for connection..." ; sleep .3
echo "20" ; sleep .1
echo "# Checking for connection..." ; sleep .3
echo "50" ; sleep .3
echo " Getting Current Version..." ; sleep .4
echo "75" ; sleep .2
echo "# Getting Current Version..." ; sleep .5
echo "100" ; sleep .2
) |
zenity --progress --auto-close \
--title="Updates" \
--text="Checking for connection" \
--percentage=0

if [ "$?" = -1 ] ; then
zenity --error \
--text="Error"
fi

source "/Users/sellersew/Desktop/Update Agent/Info.sh"

ServerCode=$(lynx -dump $Link$Region/$Version)
echo $ServerCode


if [[ $ServerCode == *"404"* ]]
then

#No update
zenity --info \
--title="Updates | PolarOS" \
--text="Your computer has the newest version of PolarOS."

else
#Update avaible


zenity --question \
--title="Updates | PolarOS" \
--text '<span foreground="black" font="15"><b>PolarOS Updates</b></span>\n<span foreground="black" font="10">Polar Computers Inc.</span>\n' \
--ok-label="Install now" \
--cancel-label="Later"




#Download File

#Install File


fi

