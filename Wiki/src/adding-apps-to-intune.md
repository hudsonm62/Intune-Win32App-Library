# Adding Apps to Intune

The workflow for adding an app to Intune is already fairly straightforward, and is made even simpler with the provided resources from this library.

## 1. Package the App

[A script is provided](./library-automation.md) to help you package the app into a `.intunewin` file. This script will download the latest installer and any extra files needed to package the app into `/source`, then will finally package using the [`IntuneWinAppUtil.exe`](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool).

```powershell
.\Scripts\Build-App.ps1 -AppName "AppName"
```

You can find the packaged `.intunewin` file in the app's folder under `/Apps`.

## 2. Upload to Intune

Upload the built `.intunewin` file to Intune as a "Win32 App". Fill out the required fields and add a logo if desired (which are also provided in the app folder).

<!--TODO Add image here for Intune upload-->

## 3. Configure App Settings

You'll need to configure the app settings. This includes specifying the install and uninstall commands, detection rules, and any requirements or dependencies.

By default, the `install.cmd` and `uninstall.cmd` scripts in the app's `/source` folder will be used for installation and uninstallation, so you can specify them directly (i.e. `.\install.cmd` and `.\uninstall.cmd`).

<!--TODO Add image of install/uninstall commands-->

Depending on the app, and installer used, you may need to adjust other settings such as the install context (user/system) and supported platform architecture (x86/x64/ARM64).

You can then use the provided detection script (`detect.ps1`) to ensure Intune can verify the app is installed correctly, and prevent it from being reinstalled unnecessarily.

## 4. Assign the App

Finally, assign the app to the desired groups or users in Intune. You can choose to make it available in the Company Portal or enforce it directly.

Ensure you test app deployment in a controlled environment before rolling it out to all users. This helps catch any issues with the install or configuration that may not have been apparent during your own testing.

However you do this depends on your organisation's policies and practices, so ensure you follow those.

## 5. Monitor and Maintain

Intune provides a handful of places to monitor app deployment status, including success and failure rates. Use these to ensure the app is being deployed correctly and troubleshoot any issues that arise.

For any problems with the app itself, you can refer to the app's documentation or support channels. If you find issues with the packaging or deployment process, consider contributing fixes back to this repository!

<!--TODO Add image of app monitoring page-->

## 6. Supersede and/or Uninstall

More information about superseding apps can be found in the [Updating Win32 Apps](./updating-win32apps.md) section.

If you simply want to uninstall the app without superseding, add your desired groups to the "Uninstall" section in Intune and the `uninstall.cmd` script will be run for those users.
