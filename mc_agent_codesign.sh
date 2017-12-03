#!/bin/bash

#### Change log ####
# Shahar: 11/14/2017
  # New file, based on mccodesign, but only handles 1 version provided as input parameter

####################

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters."
    echo "Expecting <version> parameter"
    exit
fi

VERSION=$1;
# ${versions[$i]}


    printf "\n######################### START ${VERSION} ###############################\n";
    printf "Changing directory to MC ${VERSION} Enabler folder\n";
    cd ~/OneDrive\ -\ Hewlett\ Packard\ Enterprise/4.Work/1.Mobile\ Center/${VERSION}/HPMCEnabler;

    folder=$(pwd);
    printf "Folder is now: $(pwd)\n\n";

    printf "Signing Agent...\n";
    ./HPMCEnabler HP4M-Agent.ipa -c iPhone\ Developer\:\ Shahar\ Shiff\ \(S524ZZQSE5\) -p ../../MC_Provision_Profile.mobileprovision -n HP4M-Agent-${VERSION}.ipa --verify-agent;

    printf "Signing Agent Launcher...\n";
    ./HPMCEnabler HPMC-AgentLauncher.ipa -c iPhone\ Developer\:\ Shahar\ Shiff\ \(S524ZZQSE5\) -p ../../MC_Provision_Profile.mobileprovision -n HPMC-AgentLauncher-${VERSION}.ipa;

    if [ ${VERSION} = "2.51" ]; then
      printf "Signing WebDriver Agent Runner...\n";
      ./HPMCEnabler WebDriverAgentRunner-Runner.ipa -c iPhone\ Developer\:\ Shahar\ Shiff\ \(S524ZZQSE5\) -p ../../MC_Provision_Profile.mobileprovision -n WebDriverAgentRunner-Runner-${VERSION}.ipa;

      printf "Signing WebDriverAgentRunner-Runner_xcode9.ipa...\n";
      ./HPMCEnabler WebDriverAgentRunner-Runner_xcode9.ipa -c iPhone\ Developer\:\ Shahar\ Shiff\ \(S524ZZQSE5\) -p ../../MC_Provision_Profile.mobileprovision -n WebDriverAgentRunner-Runner_xcode9-${VERSION}.ipa;
    fi

    printf "Create folder: ../../Shared MC Content/${VERSION}\n";
    mkdir ../../SharedMCContent/${VERSION};

    printf "Copy P4M-Agent.ipa to .../${VERSION} folder\n";
    cp HP4M-Agent-${VERSION}.ipa ../../SharedMCContent/${VERSION}/HP4M-Agent.ipa;

    printf "Copy HPMC-AgentLauncher.ipa to .../${VERSION}/ folder\n";
    cp HPMC-AgentLauncher-${VERSION}.ipa ../../SharedMCContent/${VERSION}/HPMC-AgentLauncher.ipa;

    if [ ${VERSION} = "2.51" ]; then
      printf "Copy WebDriverAgentRunner-Runner.ipa to .../${VERSION}/ folder\n";
      cp WebDriverAgentRunner-Runner-${VERSION}.ipa ../../SharedMCContent/${VERSION}/WebDriverAgentRunner-Runner.ipa;

      printf "Copy ebDriverAgentRunner-Runner_xcode9-${VERSION}ipa to .../${VERSION}/ folder\n";
      cp WebDriverAgentRunner-Runner_xcode9.ipa ../../SharedMCContent/${VERSION}/WebDriverAgentRunner-Runner_xcode9.ipa;
    fi

    printf "Changing directorty to ../../SharedMCContent/${VERSION}\n"
    cd ../../SharedMCContent/${VERSION}

    printf "Zipping the ipa files in .../${VERSION}\n";
    #tar -jcvf SignedAgent_v${VERSION}.tar.bz2 ./*.ipa
    zip -r SignedAgent_v${VERSION}.zip ./*.ipa

    #Printf "Remove the ipa files from .../${VERSION}\n"
    #rm *.ipa

    printf "\n############################ END ${VERSION} ############################\n\n"


printf "DONE!!!\n\n";

exit;
