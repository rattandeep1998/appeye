#!/bin/bash -l

# Download and move acextract file to /usr/local/bin
# The path is copied after downloading the zip acextract file under releases. The HTML generated redirects to this path.
# If after copying acextract still the script fails, fo to System Prefences and allow list `acextract`.

rm -rf acextract.zip
rm -rf acextract
curl -o acextract.zip 'https://objects.githubusercontent.com/github-production-release-asset-2e65be/28108471/89fa8c00-69e0-11e9-89f2-614d30af23a6?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220320%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220320T084636Z&X-Amz-Expires=300&X-Amz-Signature=32a5c855faf479aee16102d881e9f6639b23374433542e2f06bb71ba6e997d28&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=28108471&response-content-disposition=attachment%3B%20filename%3Dacextract.zip&response-content-type=application%2Foctet-stream'
unzip acextract.zip

sudo mv acextract /usr/local/bin/