# Component provenance

This project draws on the following upstream work. Release notices must accompany any redistributed components and include their corresponding source where required.

| Component | Upstream and purpose |
|---|---|
| Base | [Ubuntu release images, signed checksum lists](https://releases.ubuntu.com/26.04/) and [Canonical redistribution policy](https://canonical.com/legal/intellectual-property-policy). Preserve the package-specific copyright and source records. |
| Desktop | [Omarchy v4.5.0](https://github.com/omacom/omarchy/tree/ac2690cd7be4f47e4a255f5e2e78d904d436b068), MIT notice copyright David Heinemeier Hansson. Audit separately licensed themes, art, fonts and bundled components. |
| Compositor | [Hyprland](https://github.com/hyprwm/Hyprland), BSD-3-Clause. [Omarchy package recipe and patches](https://github.com/omacom/omarchy-pkgs/tree/HEAD/pkgbuilds/hyprland). |
| Shell runtime | [Quickshell](https://quickshell.org/) and [Omarchy's packaging repository](https://github.com/omacom/omarchy-pkgs). Inspect license text for each shipped runtime and patch. |
| Bindings | [i3 reference card](https://i3wm.org/docs/refcard.html) for keyboard conventions. |
| Idle and controls | [Sleep Guardian](https://github.com/sthuizen/omarchy-sleep-guardian-plugin) credits Pierre Berube's [Sandman](https://github.com/lgse/sandman). [Power Center](https://github.com/sthuizen/omarchy-power-center) and [Media Deck](https://github.com/sthuizen/omarchy-media-deck) contribute shell integration. Preserve the full LICENSE and CREDITS files at the chosen revisions. |
| Applications outside the base archive | [Zed](https://github.com/zed-industries/zed) and [cliamp](https://github.com/bjarneo/cliamp). Record exact distribution channel, version, license texts and sources in the release inventory. |
| Hardware | [Framework's Ubuntu 26.04 Laptop 13 installation guide](https://guides.frame.work/Guide/Ubuntu+26.04+LTS+Installation+on+the+Framework+Laptop+13/744). |
| Sleep implementation | [Ubuntu systemd sleep configuration](https://manpages.ubuntu.com/manpages/resolute/man5/systemd-sleep.conf.5.html) and [kernel protections](https://documentation.ubuntu.com/security/security-features/kernel-protections/). |

The live installer uses Debian GNU/Linux, Linux, live-boot, GNU GRUB, dosfstools and xorriso. It carries the live package database and each package's /usr/share/doc copyright notices. The target uses the public [Hyprland PPA](https://launchpad.net/~cppiber/+archive/ubuntu/hyprland), [Mozilla package archive](https://packages.mozilla.org/), [OpenAI Codex](https://github.com/openai/codex) and the corresponding upstream package licenses. The private browser extension is obtained by the owner after installation. Release preparation must archive exact corresponding source and license records for the live binaries, firmware and bootloader as applicable.
