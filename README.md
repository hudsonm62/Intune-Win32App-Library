# Intune Win32 Apps Library

A collection of Win32 Apps for Intune.

You can use these pre-made setups to quickly package Win32 apps for deployment to Intune, or repurpose this repository as a template library for your own apps.

![GitHub License](https://img.shields.io/github/license/hudsonm62/Intune-Win32App-Library)

---

Whilst we can't provide any `.intunewin` and installer files directly (due to licensing issues), we've provided enough scripts and resources to help you create and maintain them easily.

The repo is structured to allow you to both automate your own library, or pick and choose just what apps you want to use. Each App has its own folder under [`/Apps`][./Apps] and **_can_** contain the following:

- **`download.ps1`**: Script to download an installer.
- **`detect.ps1`**: Intune detection script.
- **`logo.png`**: Logo file to use for Company Portal.
- **`/source`**: Folder where required files are stored for packaging.
- **`/source/install.cmd`**: App Installation script.
- **`/source/uninstall.cmd`**: App uninstallation script.

See the [Template App](./Apps/_template) for the basic file structure.

<!-->

The below video should help you get started with the basics of using this repo as a whole:
TODO VIDEO TUT HERE
-->

You can also visit the [Wiki](https://hudsonm62.github.io/Intune-Win32App-Library) for more detailed information, examples and using some of the provided [scripts](./Scripts).

## Contributing

Still in the early stages, if you feel like something is missing or could be improved, please open an issue or a pull request.

Read [Contributing.md](https://hudsonm62.github.io/Intune-Win32App-Library/contributing) for more information.

[./Apps]: ./Apps

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## Disclaimer

This repository is not affiliated with, nor endorsed by, Microsoft Corporation. "Microsoft," "Intune," and all other mentioned trademarks are the property of their respective owners.

The scripts and resources provided herein are for educational and informational purposes only. Always test in a controlled, non-production environment before deploying them in a live setting. Use at your own risk.
