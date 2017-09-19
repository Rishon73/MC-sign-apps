#!/bin/bash

######### Change log #########
# 8/2/2014
# adding $APP_NAME variable, without the .ipa extention
# removed '-v' flag (verbose)

# 8/18/2017
# Added second arg (APP_FULL_PATH) and split it to folder, file name and file name w/o extention
# Also, moging the sign artifact file directly to SharedMCContent/SignedAOS folder (not renaming and copying anymore)
##############################

VERSION="$1"
APP_FULL_PATH="$2"
BASE=/Users/shahar/OneDrive\ -\ Hewlett\ Packard\ Enterprise/4.Work/1.Mobile\ Center/
cd "${BASE}"
echo directory is now: "$(pwd)"

NEW_FOLDER=$(date +%y-%m-%d-%H%M%S)
IPA_FOLDER=$(dirname "${APP_FULL_PATH}")
APP_NAME=$(basename "${APP_FULL_PATH}")
APP_NAME_NO_EXT="${APP_NAME%.*}"

echo "========= Print variables ============="
echo "VERSION: "$VERSION
echo "APP_FULL_PATH: "$APP_FULL_PATH
echo "BASE: "$BASE
echo "APP_NAME: "$APP_NAME
echo "APP_NAME_NO_EXT: "$APP_NAME_NO_EXT
echo "IPA_FOLDER: "$IPA_FOLDER
echo "NEW_FOLDER: "$NEW_FOLDER
echo "========================================"

echo About to run "--$VERSION/HPMCEnabler/HPMCEnabler--" on "--$IPA_FOLDER/$APP_NAME" command now...

$VERSION/HPMCEnabler/HPMCEnabler "${APP_FULL_PATH}" \
-i $VERSION/HPMCEnabler/HPMobileCenter.dylib \
-j $VERSION/HPMCEnabler/HybridJS \
-c "iPhone Developer: Shahar Shiff (S524ZZQSE5)" \
-p MC_Provision_Profile.mobileprovision \
-d "${IPA_FOLDER}"

cd "$IPA_FOLDER"
echo directory is now: "$(pwd)"

echo Moving ${IPA_FOLDER}/${APP_NAME_NO_EXT}-HPMCEnabled.ipa to $"${BASE}SharedMCContent/SignedAOS/"${APP_NAME_NO_EXT}-HPMCEnabled-${VERSION}.ipa

mv ${APP_NAME_NO_EXT}-HPMCEnabled.ipa "${BASE}SharedMCContent/SignedAOS/"${APP_NAME_NO_EXT}-HPMCEnabled-${VERSION}.ipa
echo $?

echo Done!!!
