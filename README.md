# Run Hyper-v on your home network and put VMs on your Mom's PC

## To make your Mom's Windows 10 machine a Hyper-V host you'll need to do the following:

### The hyper-V host:

1. Install the Windows Hyper-V components.

* If this is a Windows 10 Pro then run [hyper-v.ps1](https://github.com/markosluga/hyper_active/blob/main/hyper-v.ps1).

(Instructions on other ways to that can be found on [the Mincrosoft Docs](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v).)

* If this is a Windows 10 Home then run the [hv.bat](https://github.com/markosluga/hyper_active/blob/main/hv.bat) as administrator.

**All credits for hv.bat go to [HankTerrebrood-5600](https://docs.microsoft.com/en-us/answers/questions/29175/installation-of-hyper-v-on-windows-10-home.html)**

2. Create (or enable) an Administrative user with password a password. 

* If you want to enable the Administrator account in Windows 10 Home quickly run [enable-admin.cmd](https://github.com/markosluga/hyper_active/blob/main/enable-admin.cmd).

3. Enable the Windows Remote Management rules in the firewall and enable remote management - run [enable-wrm.ps1](https://github.com/markosluga/hyper_active/blob/main/enable-wrm.ps1)

Repeat for your Sister's, Dad's, Brother's, Wife's, Kids etc. computers. But remember to **keep it in the family**!

### The manamgennt host

1. On the managment machine install [Hyper-V manager (hyper-v-manager.ps1)](https://github.com/markosluga/hyper_active/blob/main/hyper-v-manager.ps1) or go with the [full package with hyper-v.ps1](https://github.com/markosluga/hyper_active/blob/main/hyper-v.ps1) just like on the hosts.

2. Add the machines as trusted hosts - you can ad the hosts as a list like mompc,dadpc,etc. or just use * instead :D enable the remote management clint role and create a policy. 
* To go with the defaults using * just run [configure-manager.ps1](https://github.com/markosluga/hyper_active/blob/main/configure-manager.ps1)

Use Hyper-V manager to connect to teach host that you have configured with the local administrative user-pass from step 2. 

* Remember the format of the username needs to be formatted as `COMPUTER\Username`
