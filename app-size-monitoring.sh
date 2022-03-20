#!/bin/bash -l
curl -o app-directory-size-master.txt http://nexus.intuit.com/nexus/content/repositories/CEG.Mint.Intuit-Releases/com/intuit/finance/Mint-iOS/10.0.0/mint-app-directory-size-master.txt
curl -o app-directory-size-last-release.txt http://nexus.intuit.com/nexus/content/repositories/CEG.Mint.Intuit-Releases/com/intuit/finance/Mint-iOS/null/mint-app-directory-size.txt

killall Google\ Chrome
sleep 1
open -a 'Google Chrome' --args -allow-file-access-from-files file://$PWD/app-size-diff.html