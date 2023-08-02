# Set registry key path 
$regKey = "HKLM:\Software\Policies\Microsoft\Windows\OneDrive"

# Get current value of DisableFileSyncNGSC
$value = Get-ItemProperty -Path $regKey -Name "DisableFileSyncNGSC"

# Check if DWORD value is 1
if($value.DisableFileSyncNGSC -eq 1){

  # Set DWORD value to 0 to enable OneDrive sync
  Set-ItemProperty -Path $regKey -Name "DisableFileSyncNGSC" -Value 0

  # Print message
  Write-Host "OneDrive sync has been enabled by setting DisableFileSyncNGSC to 0"

} else {

  # Print message that no change was needed
  Write-Host "DisableFileSyncNGSC is already set to 0, no change needed"

}