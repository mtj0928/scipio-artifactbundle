#!/bin/bash

VERSION_STRING="$1"
BINARY_NANM="$2"
BINARY_PATH="$3"

mkdir -p $BINARY_NANM.artifactbundle/$BINARY_NANM-$VERSION_STRING-macos/bin

sed -e "s/__VERSION__/$VERSION_STRING/g" -e "s/__NAME__/$BINARY_NANM/g" ./info.json > "$BINARY_NANM.artifactbundle/info.json"

cp -f "$BINARY_PATH" "$BINARY_NANM.artifactbundle/$BINARY_NANM-$VERSION_STRING-macos/bin"

zip -yr - "$BINARY_NANM.artifactbundle" > "./$BINARY_NANM-macos.artifactbundle.zip"