# Run Hyper-v on your home network and put VMs on your Mom's PC

## To make your Mom's Windows 10 machine a Hyper-V host you'll need to do the following:

### The hyper-V host:

1. Install the Windows Hyper-V components.

* If this is a Windows 10 Pro then run the foolowing PowerShell command as administrator:

`Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`

(Instructions on other ways to that can be found on [the Mincrosoft Docs](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v).)

* If this is a Windows 10 Home then run the [hv.bat](https://github.com/markosluga/hyper_active/blob/main/hv.bat) as administrator.

**All credits for hv.bat go to [HankTerrebrood-5600](https://docs.microsoft.com/en-us/answers/questions/29175/installation-of-hyper-v-on-windows-10-home.html)**

2. Create (or enable) an Administrative user with password a password. If you want to enable the Administrator account in Windows 10 Home quickly run this:

`net user administrator /active:yes`
`net user administrator afairlysecurenewpassword`

3. Enable the Windows Remote Management rules in the firewall - run the following PowerShell commands as administrator:

`Enable-NetFirewallRule -DisplayName "Windows Remote Management - Compatibility Mode (HTTP-In)"`
`Enable-NetFirewallRule -DisplayName "Windows Remote Management (HTTP-In)"`

4. To enable remote manangment on the Hyper-V host(s) run the following Powershell commands as admin:
`Enable-PSRemoting`
`Enable-WSManCredSSP -Role server`

5. Repeat for your Sister's, Dad's, Brother's, Wife's, Kids etc. computers. But remember to **keep it in the family**!

### The manamgennt host

1. On the managment machine install (at least) Hyper-V manager.

2. Add the machines as trusted hosts - you can ad the hosts as a list like mompc,dadpc,etc. or just use * instead :D enable the remote management clint role and create a policy. 
All of this can easily be done by just running the following PowerShell commands as administrator:

`Set-Item WSMan:\localhost\Client\TrustedHosts -Value *
Enable-WSManCredSSP -Role client -DelegateComputer *
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\" -Name 'CredentialsDelegation'
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\" -Name 'AllowFreshCredentialsWhenNTLMOnly' -PropertyType DWord -Value "00000001"
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\" -Name 'ConcatenateDefaults_AllowFreshNTLMOnly' -PropertyType DWord -Value "00000001"
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\" -Name 'AllowFreshCredentialsWhenNTLMOnly'
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\AllowFreshCredentialsWhenNTLMOnly\" -Name '1' -Value "wsman/*"`

Use Hyper-V manager to connect to teach host that you have configured with the local administrative user-pass from step 2. 

* Remember the format of the username needs to be formatted as `COMPUTER\Username`
