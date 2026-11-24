# Framework Hypr Desktop

An independent Ubuntu 26.04 LTS installation project for the Framework Laptop 13 AMD Ryzen 7040. The intended session runs Omarchy's Quickshell desktop on Hyprland with traditional i3 navigation. Ubuntu supplies the base OS, kernel, security updates and normal application packages.

## Build status

The project is in integration. The upstream installer is a build input. A release requires a working installed desktop, recovery and resume evidence. See [design and acceptance](docs/design.md), [component credits](docs/credits.md) and the [application profile](profile/applications.tsv).

## Build and start

On an x86-64 Linux host with rootless Podman and squashfs-tools, run `scripts/build-iso`. The output is `dist/framework-hypr-amd64.iso` with `dist/SHA256SUMS`. The USB installer runs a Debian live environment with NetworkManager and MediaTek firmware. The installed operating system comes from the Ubuntu archive. Installation requires internet access. Test the candidate on a disposable disk while integration is underway.

The intended desktop shortcut **Super+F1** opens Finish setup. It includes GitHub sign-in, Codex sign-in and update, the optional private Firefox bridge, system details and power controls. **Super+Ctrl+Enter** opens Codex. Review the [plugin selection and test record](docs/plugins.md) before enabling optional additions.
