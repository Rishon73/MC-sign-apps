#!/bin/bash

VERSION="$1"
BASE=/Users/shahar/OneDrive\ -\ Hewlett\ Packard\ Enterprise/4.\ Work/1.Mobile\ Center/
cd "${BASE}"
echo directory is now: "$(pwd)"

NEW_FOLDER=$(date +%y-%m-%d-%H%M%S)
IPA_FOLDER=Mobile\ Apps/AOS/May\ 25\ 2017\ -\ v1.1.1
PATH2="${IPA_FOLDER}/$NEW_FOLDER"

mkdir "${PATH2}"
echo "${PATH2}" was created...

echo About to run "--$VERSION/HPMCEnabler/HPMCEnabler--" on "--$IPA_FOLDER/Advantage\ Shopping.ipa--" command now...

$VERSION/HPMCEnabler/HPMCEnabler "${IPA_FOLDER}"/Advantage\ Shopping.ipa \
-i $VERSION/HPMCEnabler/HPMobileCenter.dylib \
-j $VERSION/HPMCEnabler/HybridJS \
-c "iPhone Developer: Shahar Shiff (S524ZZQSE5)" \
-p MC_Provision_Profile.mobileprovision \
-d "${PATH2}" \
-v

echo Renaming ${PATH2}/Advantage Shopping-HPMCEnabled.ipa to ${PATH2}/Advantage Shopping-HPMCEnabled-${VERSION}.ipa

echo Renaming app... $PATH2
cd "$PATH2"
echo directory is now: "$(pwd)"

mv Advantage\ Shopping-HPMCEnabled.ipa Advantage\ Shopping-HPMCEnabled-${VERSION}.ipa

echo Done!!!
