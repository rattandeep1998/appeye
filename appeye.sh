#!/bin/bash -l

archivePathMaster="http://nexus.intuit.com/nexus/content/repositories/CEG.Mint.Intuit-Releases/com/intuit/finance/Mint-iOS/10.0.0/archive.xcarchive-10.0.0(1.24019).zip"
archivePathLastRelease="http://nexus.intuit.com/nexus/content/repositories/CEG.Mint.Intuit-Releases/com/intuit/finance/Mint-iOS/null/archive.xcarchive-150.58.1(1.23967).zip"

# Master Archive Extract Operations
# rm -rf ArchiveMaster.zip
# curl -o ArchiveMaster.zip ${archivePathMaster}

rm -rf output
unzip ArchiveMaster.zip
rm -rf App-Master.app
cp -R ./output/archive.xcarchive/Products/Mint.app App-Master.app

echo "MASTER - EXTRACT AND DIRECTORY ANALYSIS COMPLETE"

# Last Release Archive Extract Operations
# rm -rf ArchiveLastRelease.zip
# curl -o ArchiveLastRelease.zip ${archivePathLastRelease}

rm -rf output
unzip ArchiveLastRelease.zip
rm -rf App-Last-Release.app
cp -R ./output/archive.xcarchive/Products/Mint.app App-Last-Release.app

echo "LAST RELEASE - EXTRACT AND DIRECTORY ANALYSIS COMPLETE"

sh size-comparator.sh App-Master.app App-Last-Release.app

# Cleanup
rm -rf output
# rm -rf App-Master.app
# rm -rf App-Last-Release.app