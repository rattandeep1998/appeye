#!/bin/bash -l

archivePathMaster="http://nexus.intuit.com/nexus/content/repositories/CEG.Mint.Intuit-Releases/com/intuit/finance/Mint-iOS/150.62.1/archive.xcarchive-150.62.1(1.24143).zip"
archivePathLastRelease="http://nexus.intuit.com/nexus/content/repositories/CEG.Mint.Intuit-Releases/com/intuit/finance/Mint-iOS/150.61.0/archive.xcarchive-150.61.0(1.24107).zip"

# Master Archive Extract Operations
rm -rf ArchiveMaster.zip
curl -o ArchiveMaster.zip ${archivePathMaster}

rm -rf output
unzip ArchiveMaster.zip
rm -rf App-Master.app
cp -R ./output/archive.xcarchive/Products/Mint.app App-Master.app

echo "====================================================================="
echo "MASTER - EXTRACT AND DIRECTORY ANALYSIS COMPLETE"
echo "====================================================================="

# Last Release Archive Extract Operations
rm -rf ArchiveLastRelease.zip
curl -o ArchiveLastRelease.zip ${archivePathLastRelease}

rm -rf output
unzip ArchiveLastRelease.zip
rm -rf App-Last-Release.app
cp -R ./output/archive.xcarchive/Products/Mint.app App-Last-Release.app

echo "====================================================================="
echo "LAST RELEASE - EXTRACT AND DIRECTORY ANALYSIS COMPLETE"
echo "====================================================================="

sh size-comparator.sh App-Master.app App-Last-Release.app

# Cleanup
rm -rf output
# rm -rf App-Master.app
# rm -rf App-Last-Release.app