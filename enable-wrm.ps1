Enable-NetFirewallRule -DisplayName "Windows Remote Management - Compatibility Mode (HTTP-In)"
Enable-NetFirewallRule -DisplayName "Windows Remote Management (HTTP-In)"
Enable-NetFirewallRule -DisplayName "Windows Remote Management (HTTP-In)"
Enable-PSRemoting
Set-Service -Name "WinRM" -Status running -StartupType automatic
