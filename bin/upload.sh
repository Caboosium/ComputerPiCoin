#!/bin/sh
FIXED_BRANCH=$(echo $BRANCH | sed 's/\//-/g')
ARCHIVE="$REPO_NAME-$FIXED_BRANCH-$COMMIT.tar.bz2"
echo "Creating archive $ARCHIVE"
tar cfj $ARCHIVE ./
FILESIZE=$(stat -c%s "$ARCHIVE")
echo "Finished archive (size $FILESIZE), starting Google Drive upload"
./bin/gdrive upload --refresh-token $GDRIVE_REFRESH_TOKEN --parent $GDRIVE_DIR "$ARCHIVE"
echo "Finished Google Drive upload"
