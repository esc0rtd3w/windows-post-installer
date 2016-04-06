#!/bin/sh



# Gets current running directory of shell script file
runPath="/"
savePath="$PWD"


# Set permissions and workaround for launching from NTFS media
#chown root:root "$savePath/get_update.sh"
#chmod 0705 "$savePath/get_update.sh"


updateFile="ChromeStandaloneSetup.exe"

linkPath="https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B0683301B-07D1-FC29-011C-591712DA149B%7D%26lang%3Den%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dtrue/update2/installers/ChromeStandaloneSetup.exe"

nocert="--no-check-certificate"

wget $nocert -O "$runPath$updateFile" $linkPath


#read pause

echo "Copying New Update to Portable Media...."
echo ""

#echo "$runPath"
#echo "$savePath"

#read pause


cp "$runPath$updateFile" "$savePath"

rm "$runPath$updateFile"

#pause



