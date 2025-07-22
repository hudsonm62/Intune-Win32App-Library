# Contributing

This repository is still in the early stages, and contributions are welcome! If you feel like something is missing or could be improved, please open an issue or a pull request.

## Adding your own apps

To add your own app to this repository:

- Copy the [`_template`][_template] folder.
- Rename it to your app's name.
- Fill in the required information for your app.

You can also run the following to quickly copy the template into a new app folder:

```powershell
./Scripts/New-App.ps1 "Cool App"
```

!!! note

    We've essentially ignored MSI installers, as Intune has nice support for them out of the box. However if you have an MSI that requires extra files or configuration that can't be handled by `msiexec` arguments, you can still add it to this repository as a Win32 App.

## Updating the template

If you make changes to the [`_template`][_template]:

- Ensure similar updates are reflected across all existing apps in the [`./Apps`](https://github.com/hudsonm62/Intune-Win32App-Library/blob/master/Apps) directory.
    - Of course, ignore any app-specific changes that don't apply to the template.
- Test your changes where possible before committing.

## Updating the Docs

This documentation is built using [MkDocs](https://www.mkdocs.org/) with the iconic [MkDocs Material Theme](https://squidfunk.github.io/mkdocs-material/).

[Python](https://www.python.org/downloads/) is required to build the docs, so ensure you have it installed. You can then install the required packages with:

```bash
pip install -r ./Wiki/requirements.txt
```

You can then build or serve the docs with the provided PowerShell script:

```powershell
./Scripts/Build-Docs.ps1 #-Serve
```

To quickly clean out the built directory and asset cache, run:

```powershell
./Scripts/Clean-TemporaryFiles.ps1
```

[_template]: https://github.com/hudsonm62/Intune-Win32App-Library/blob/master/Apps/_template
