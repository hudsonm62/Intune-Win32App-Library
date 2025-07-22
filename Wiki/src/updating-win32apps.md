# Updating Win32 Apps

As of writing, Intune doesn't allow you to straight up "replace" an existing app. Instead, we need to **create a new Win32 App and 'supersede' the old** version.

It's essential to know both the app, and it's shipped configuration. For example some apps may include self-updaters that require no changes, whilst others may require a manual supersede every other day. Some apps may even require the same version installed for the app to be uninstalled correctly.

- Read more about [superseding Win32 Apps](https://learn.microsoft.com/en-us/intune/intune-service/apps/apps-win32-supersedence)

![superseding example](assets/img/superseding%20example.png)

Once you the new version has been deployed, you can then remove the old app from Intune. **This will not uninstall the app from devices**, but will prevent it from being reinstalled in the future.
