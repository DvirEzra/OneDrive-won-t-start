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
