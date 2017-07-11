#!/bin/bash

VERSION="$1"
cd /Users/shahar/OneDrive\ -\ Hewlett\ Packard\ Enterprise/4.\ Work/1.Mobile\ Center/

FOLDER=$(date +%y-%m-%d-%H%M%S)

mkdir Mobile\ Apps/AOS/May\ 25\ 2017\ -\ v1.1.1/$FOLDER
echo Dir "Mobile\ Apps/AOS/May\ 25\ 2017\ -\ v1.1.1/$FOLDER"  was created!

echo running "$VERSION/HPMCEnabler/HPMCEnabler" command

$VERSION/HPMCEnabler/HPMCEnabler Mobile\ Apps/AOS/May\ 25\ 2017\ -\ v1.1.1/Advantage\ Shopping.ipa \
-i $VERSION/HPMCEnabler/HPMobileCenter.dylib \
-j $VERSION/HPMCEnabler/HybridJS \
-c "iPhone Developer: Shahar Shiff (S524ZZQSE5)" \
-p MC_Provision_Profile.mobileprovision \
-d Mobile\ Apps/AOS/May\ 25\ 2017\ -\ v1.1.1/$FOLDER \
-v
