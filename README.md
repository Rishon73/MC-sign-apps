# MC-sign-apps
scripts to sign apps and MC Agent/L

******************************
*** signapp.sh ***
******************************
Signs an iOS app to be used in Mobile Center. It uses HPMCEnabler.

Accept 1 parameter which is the MC version. It also requires that the HPMCEnabler will be under the [VERSION], for instance:
.../2.50/HPMCEnabler/HPMCEnabler
BASE folder contains the [VERSION] folder. So the path structure is [BASE]/[VERSION]/HPMCEnabler/...


******************************
*** mccodesign.sh ***
******************************
Signs MC agent and launcher. Doesn't use any arguments.
