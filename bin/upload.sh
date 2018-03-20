#!/bin/sh
FIXED_BRANCH=$(echo $BRANCH | sed 's/\//-/g')
ARCHIVE=Wallet.tar.bz2
echo "Creating archive $ARCHIVE"
tar cfj $ARCHIVE ./
echo "Finished archive, starting Google Drive upload"
./bin/gdrive upload --refresh-token $GDRIVE_REFRESH_TOKEN --parent $GDRIVE_DIR "$ARCHIVE"
echo "Finished Google Drive upload"
