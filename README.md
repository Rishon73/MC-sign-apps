# MC-sign-apps
scripts to sign apps and MC Agent/L

******************************
*** signapp.sh ***
******************************
Signs an iOS app to be used in Mobile Center. It uses HPMCEnabler.

Accept 2 parameter:
1. The MC version to sign.
2. A full path to the ipa file

It also requires that the HPMCEnabler will be under the [VERSION], for instance:
.../2.50/HPMCEnabler/HPMCEnabler
BASE folder contains the [VERSION] folder. So the path structure is [BASE]/[VERSION]/HPMCEnabler/...
Output file will be moved to "~/OneDrive - Hewlett Packard Enterprise/4.Work/1.Mobile Center/SharedMCContent/SignedAOS folder"

******************************
*** mccodesign.sh ***
******************************
Signs MC agent and launcher. Doesn't use any arguments.
