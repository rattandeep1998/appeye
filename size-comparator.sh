#!/bin/bash -l

latestApp=$1
lastReleasedApp=$2

masterAppDirUsage="app-directory-size-master.txt"
lastReleasedAppDirUsage="app-directory-size-last-release.txt"

## Extract and Remove Assets.car file
cd ${latestApp}
acextract -i Assets.car -o Assets
rm -rf Assets.car
cd ..

## Directory Usage
du -h -d1 ${latestApp}/Assets/* > ${masterAppDirUsage}
du -h -d1 ${latestApp}/* >> ${masterAppDirUsage}
du -sh ${latestApp} >> ${masterAppDirUsage}

if [ -z "$lastReleasedApp" ]
then
    # Copy contents of master app directory usage to last released app diorectory usage
    cat ${masterAppDirUsage} > ${lastReleasedAppDirUsage}
    echo "RATTAN"
else
    # Rename latest app to temp
    # Rename last released app name to latest app name - This is done to perform directory size analysis.
    # Revert the above changes
    rm -rf temp-${latestApp}
    mv ${latestApp} temp-${latestApp}

    rm -rf ${latestApp}
    mv ${lastReleasedApp} ${latestApp}

    ## Extract and Remove Assets.car file
    cd ${latestApp}
    acextract -i Assets.car -o Assets
    rm -rf Assets.car
    cd ..

    ## Directory Usage
    du -h -d1 ${latestApp}/Assets/* > ${lastReleasedAppDirUsage}
    du -h -d1 ${latestApp}/* >> ${lastReleasedAppDirUsage}
    du -sh ${latestApp} >> ${lastReleasedAppDirUsage}

    # Revert the above temp changes
    rm -rf ${lastReleasedApp}
    mv ${latestApp} ${lastReleasedApp} 

    rm -rf ${latestApp}
    mv temp-${latestApp} ${latestApp} 
    rm -rf temp-${latestApp}
fi

# Render Chart
killall Google\ Chrome
sleep 1
open -a 'Google Chrome' --args -allow-file-access-from-files file://$PWD/app-size-diff.html