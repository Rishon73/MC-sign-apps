#!/bin/bash

#### Change log ####
# Shahar: 4/24/2017
  # Message formating and new 'folder' parameter
  # Remove the "-CodeSigned" from the ipa file names
  # zip the output files and remove them from the version folders

####################


versions=("2.01" "2.01p1" "2.20" "2.50" "2.51")

for i in "${!versions[@]}"; do
    printf "\n######################### START ${versions[$i]} ###############################\n";
    printf "Changing directory to MC ${versions[$i]} Enabler folder\n";
    cd ~/OneDrive\ -\ Hewlett\ Packard\ Enterprise/4.Work/1.Mobile\ Center/${versions[$i]}/HPMCEnabler;

    folder=$(pwd);
    printf "Folder is now: $(pwd)\n\n";

    printf "Signing Agent...\n";
    ./HPMCEnabler HP4M-Agent.ipa -c iPhone\ Developer\:\ Shahar\ Shiff\ \(S524ZZQSE5\) -p ../../MC_Provision_Profile.mobileprovision -n HP4M-Agent-${versions[$i]}.ipa --verify-agent;

    printf "Signing Agent Launcher...\n";
    ./HPMCEnabler HPMC-AgentLauncher.ipa -c iPhone\ Developer\:\ Shahar\ Shiff\ \(S524ZZQSE5\) -p ../../MC_Provision_Profile.mobileprovision -n HPMC-AgentLauncher-${versions[$i]}.ipa;

    if [ ${versions[$i]} = "2.51" ]; then
      printf "Signing WebDriver Agent Runner...\n";
      ./HPMCEnabler WebDriverAgentRunner-Runner.ipa -c iPhone\ Developer\:\ Shahar\ Shiff\ \(S524ZZQSE5\) -p ../../MC_Provision_Profile.mobileprovision -n WebDriverAgentRunner-Runner-${versions[$i]}.ipa;

      printf "Signing WebDriverAgentRunner-Runner_xcode9.ipa...\n";
      ./HPMCEnabler WebDriverAgentRunner-Runner_xcode9.ipa -c iPhone\ Developer\:\ Shahar\ Shiff\ \(S524ZZQSE5\) -p ../../MC_Provision_Profile.mobileprovision -n WebDriverAgentRunner-Runner_xcode9-${versions[$i]}.ipa;

    fi

    printf "Create folder: ../../Shared MC Content/${versions[$i]}\n";
    mkdir ../../SharedMCContent/${versions[$i]};

    printf "Copy P4M-Agent.ipa to .../${versions[$i]} folder\n";
    cp HP4M-Agent.ipa ../../SharedMCContent/${versions[$i]}/HP4M-Agent-${versions[$i]}.ipa;

    printf "Copy HPMC-AgentLauncher.ipa to .../${versions[$i]}/ folder\n";
    cp HPMC-AgentLauncher.ipa ../../SharedMCContent/${versions[$i]}/HPMC-AgentLauncher-${versions[$i]}.ipa;

    if [ ${versions[$i]} = "2.51" ]; then
      printf "Copy WebDriverAgentRunner-Runner.ipa to .../${versions[$i]}/ folder\n";
      cp WebDriverAgentRunner-Runner.ipa ../../SharedMCContent/${versions[$i]}/WebDriverAgentRunner-Runner-${versions[$i]}.ipa;

      printf "Copy WebDriverAgentRunner-Runner.ipa to .../${versions[$i]}/ folder\n";
      cp WebDriverAgentRunner-Runner_xcode9.ipa ../../SharedMCContent/${versions[$i]}/WebDriverAgentRunner-Runner_xcode9-${versions[$i]}ipa;
    fi

    printf "Changing directorty to ../../SharedMCContent/${versions[$i]}\n"
    cd ../../SharedMCContent/${versions[$i]}

    printf "Zipping the ipa files in .../${versions[$i]}\n";
    #tar -jcvf SignedAgent_v${versions[$i]}.tar.bz2 ./*.ipa
    zip -r SignedAgent_v${versions[$i]}.zip ./*.ipa

    #Printf "Remove the ipa files from .../${versions[$i]}\n"
    #rm *.ipa

    printf "\n############################ END ${versions[$i]} ############################\n\n"
done

printf "DONE!!!\n\n";

exit;
