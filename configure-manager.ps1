Set-Item WSMan:\localhost\Client\TrustedHosts -Value *
Enable-WSManCredSSP -Role client -DelegateComputer *
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\" -Name 'CredentialsDelegation'
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\" -Name 'AllowFreshCredentialsWhenNTLMOnly' -PropertyType DWord -Value "00000001"
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\" -Name 'ConcatenateDefaults_AllowFreshNTLMOnly' -PropertyType DWord -Value "00000001"
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\" -Name 'AllowFreshCredentialsWhenNTLMOnly'
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\AllowFreshCredentialsWhenNTLMOnly\" -Name '1' -Value "wsman/*"
