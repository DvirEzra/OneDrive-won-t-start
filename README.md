# OneDrive won't start

# Problem
After you install the OneDrive sync app (onedrive.exe) to sync your OneDrive for work or school files, or update your Operating System, you may experience one or more of the following symptoms:

You're not prompted for sign-in.

No synchronization of files occurs, and no error message is displayed.

If you’re also running OneDrive personal, and you click Settings on the Add a Business account dialog box, nothing happens.

 # Solution
An administrator of your organization has configured a Group Policy setting to prevent onedrive.exe from starting. Work with your company’s administrator to change the applicable Group Policy Object (GPO). You can confirm that your computer is affected by the policy by following these steps. 

![image](https://github.com/DvirEzra/OneDrive-won-t-start/assets/122629905/6d83dfcc-6114-42c7-a78c-c690616ee26a)


# 1. Navigate to the following registry key:

  HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\OneDrive 

  ![image](https://github.com/DvirEzra/OneDrive-won-t-start/assets/122629905/0f91851c-e26b-4393-b6c1-76fa58ca2349)



# 2. Check the following key:

  DisableFileSyncNGSC = DWORD:1 

  ![image](https://github.com/DvirEzra/OneDrive-won-t-start/assets/122629905/8acf4395-e9bd-4e68-aa4b-159f029d8775)


In order to sync with OneDrive for work or school, the DisableFileSyncNGSC key must be removed or the DWORD value must be changed to 0 (zero). If the registry value was set as part of a Group Policy Object, the policy must be removed.

If you decide to manually change this key or to remove the key without having your administrator change the policy for your computer, the next time the policy runs (typically after a restart, after you sign in to Windows, or after periodic updates), the policy is reapplied, and OneDrive for work or school won't start again.


Here is an example README file for your OneDrive sync enabler script repository:

# OneDrive Sync Enabler 

This repository contains a PowerShell script to enable OneDrive sync on machines where it has been disabled by Group Policy.

## Script

The FixOneDriveStart.ps1 script checks the registry key value and enables sync if needed:

```powershell
# FixOneDriveStart.ps1 script content here
```

## Usage

To use the script:

1. Download FixOneDriveStart.ps1
2. Open PowerShell as administrator
3. Run the script:

```
.\FixOneDriveStart.ps1
```

4. OneDrive sync should now be enabled

## Script Description

The FixOneDriveStart.ps1 script fixes the issue where OneDrive sync is prevented from starting due to a Group Policy setting.

It checks the registry key HKLM:\Software\Policies\Microsoft\Windows\OneDrive for the value of DisableFileSyncNGSC. If this DWORD value is set to 1, it will change it to 0 to allow OneDrive sync.

The script first gets the current value using Get-ItemProperty. It then checks if the value is 1, indicating sync is disabled. If so, it uses Set-ItemProperty to set the value to 0 to enable sync.

Finally, it prints out messages indicating the status and whether any change was made.

This allows machines with the Group Policy setting to have OneDrive sync enabled without needing to change the policy itself. The script can be run on any affected machines to re-enable sync.
