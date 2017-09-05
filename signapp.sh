#!/bin/bash

######### Change log #########
# 8/2/2014
# adding $APP_NAME variable, without the .ipa extention
# removed '-v' flag (verbose)
#
##############################

VERSION="$1"
BASE=/Users/shahar/OneDrive\ -\ Hewlett\ Packard\ Enterprise/4.\ Work/1.Mobile\ Center/
cd "${BASE}"
echo directory is now: "$(pwd)"

NEW_FOLDER=$(date +%y-%m-%d-%H%M%S)
IPA_FOLDER=Mobile\ Apps/AOS/July\ 2017\ -\ v1.1.2
PATH2="${IPA_FOLDER}/$NEW_FOLDER"
APP_NAME=Advantage+demo+1_1_2

mkdir "${PATH2}"
echo "${PATH2}" was created...

echo About to run "--$VERSION/HPMCEnabler/HPMCEnabler--" on "--$IPA_FOLDER/$APP_NAME.ipa--" command now...

$VERSION/HPMCEnabler/HPMCEnabler "${IPA_FOLDER}"/$APP_NAME.ipa \
-i $VERSION/HPMCEnabler/HPMobileCenter.dylib \
-j $VERSION/HPMCEnabler/HybridJS \
-c "iPhone Developer: Shahar Shiff (S524ZZQSE5)" \
-p MC_Provision_Profile.mobileprovision \
-d "${PATH2}"

echo Renaming ${PATH2}/${APP_NAME}-HPMCEnabled.ipa to ${PATH2}/${APP_NAME}-HPMCEnabled-${VERSION}.ipa

cd "$PATH2"
echo directory is now: "$(pwd)"

#mv Advantage\ Shopping-HPMCEnabled.ipa Advantage\ Shopping-HPMCEnabled-${VERSION}.ipa
mv ${APP_NAME}-HPMCEnabled.ipa ${APP_NAME}-HPMCEnabled-${VERSION}.ipa

echo copy to "Shared MC Content/Signed AOS" folder
echo "${BASE}"
/bin/cp ${APP_NAME}-HPMCEnabled-${VERSION}.ipa "${BASE}SharedMCContent/SignedAOS/"
echo $?

echo Done!!!
