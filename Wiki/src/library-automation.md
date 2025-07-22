# Library Automation

This repository can be treated as a template for your own Win32 Apps. It's typically the administrator's responsibility to ensure apps are up to date, managed and protected properly. This repository intends to _assist_ with that overhead.

---

Lifecycle scripts can be found under [`./Scripts`](https://github.com/hudsonm62/Intune-Win32App-Library/blob/master/Scripts).

You can quickly download and package an app with [`Build-App.ps1`](https://github.com/hudsonm62/Intune-Win32App-Library/blob/master/Scripts/Build-App.ps1). This script will download the latest installers and any extra files needed to package the app into `/source`, then will package using the [`IntuneWinAppUtil.exe`](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool) tool.

```powershell
.\Scripts\Build-App.ps1 -AppName "AppName" #-URIOverride "https://example.com/latest-installer.exe"
# OR
.\Scripts\Build-App.ps1 -All
```

For Installers that are released to GitHub, the latest will be pulled automatically instead. See [`Get-LatestGitHubRelease.ps1`](https://github.com/hudsonm62/Intune-Win32App-Library/blob/master/Scripts/Get-LatestGitHubRelease.ps1) and the [Notepad++ App](https://github.com/hudsonm62/Intune-Win32App-Library/blob/master/Apps/Notepad++) to see this in action.

!!! warning

    You must update or override the URI for the installer in the `download.ps1` script for each app (unless using latest GitHub releases already).
