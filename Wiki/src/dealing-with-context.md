# Dealing with Context

Some apps may require user context to install correctly, while others may need system context and/or extra flags (i.e. `ALLUSERS=1` or `/ALLUSERS`) to function. I've included both for all apps (where supported), however ensure you test thoroughly for your preferred use-case.

For example:

```batch title="install.cmd"
:: System:
app-installer.exe /S /ALLUSERS=1

:: User:
app-installer.exe /S
```

As of writing, Intune will always run uninstallation commands as SYSTEM regardless of the original install context. In this case, environment variables (such as `%USERNAME%`) don't work as expected and won't resolve to user specific paths, leading to errors.

To fix this, we can wrap the uninstall command inside `cmd.exe /c ""`, which makes Intune run the command as the user. See the [Greenshot App](https://github.com/hudsonm62/Intune-Win32App-Library/blob/master/Apps/Greenshot) and [App Template](https://github.com/hudsonm62/Intune-Win32App-Library/blob/master/Apps/_template) for simple examples of this.

```batch title="uninstall.cmd"
:: 64bit:
"%ProgramFiles%\AppName\uninstall.exe" /S

:: 32bit:
"%ProgramFiles(x86)%\AppName\uninstall.exe" /S

:: User:
cmd.exe /c ""%LOCALAPPDATA%\AppName\uninstall.exe" /S"
```

!!! note

    Using the `cmd` wrapper isn't entirely silent, as it will show a command prompt window briefly.

---

- [Microsoft Learn | Local Accounts](https://learn.microsoft.com/en-us/windows/security/identity-protection/access-control/local-accounts#system)
