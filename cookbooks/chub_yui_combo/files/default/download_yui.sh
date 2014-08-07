#!/bin/bash
usage() {
	echo "Usage: $0 yuiVersion"
	exit 1
}

[[ $# -eq 0 ]] && usage

YUI_VERSION="$1"
YUI_RELEASES_URL="http://yui.zenfs.com/releases/yui3"
YUI_ZIP_FILE="yui_${YUI_VERSION}.zip"
ZIP_BUILD_FILES="yui/build/*"
TEMP_DIR="/tmp/yui"
DEST_COMBO_DIR="/var/combo/yui/${YUI_VERSION}"

# download the YUI release
mkdir -p ${TEMP_DIR}
wget -O ${TEMP_DIR}/${YUI_ZIP_FILE} ${YUI_RELEASES_URL}/${YUI_ZIP_FILE}

# quit if the YUI release could not be downloaded
if [[ $? != 0 ]] ; then
	exit 1
fi

# unzip the build files
unzip ${TEMP_DIR}/${YUI_ZIP_FILE} ${ZIP_BUILD_FILES} -d ${TEMP_DIR}/${YUI_VERSION}/

# move it to the combo directory
mkdir -p ${DEST_COMBO_DIR}
cp -r ${TEMP_DIR}/${YUI_VERSION}/${ZIP_BUILD_FILES} ${DEST_COMBO_DIR}
chown combo ${DEST_COMBO_DIR}
chgrp combo ${DEST_COMBO_DIR}

# remove the temp files
rm ${TEMP_DIR}/${YUI_ZIP_FILE}
rm -rf ${TEMP_DIR}/${YUI_VERSION}
