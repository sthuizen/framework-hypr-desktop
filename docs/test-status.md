# Integration test record, 24 November 2026

| Check | Result |
|---|---|
| Canonical installer input | GPG signature and SHA-256 verified for ubuntu-26.04.1-live-server-amd64.iso. |
| Kernel power states | OVMF tests recorded in design.md. The installer kernel exposes disk sleep with Secure Boot off. |
| Ubuntu desktop build | Hyprland reports 0.57.2 and native-built Quickshell reports 0.3.2 in the Ubuntu 26.04 container. Graphical session acceptance is outstanding. |
| Codex CLI | Pinned installation and latest-stable update exercised using a disposable user prefix. Both reported codex-cli 0.172.0. |
| Hardware skill | Skill validator passed. Diagnostic command reported the Framework's graphics, firmware and power information. |
| Installer boot | QEMU/KVM booted the USB-compatible UEFI image and displayed the networking, installation, diagnostics and shell menu. |
| Disk test | In a 64 GiB disposable guest the installer verified the archive signature, required a typed erase confirmation, opened LUKS2 and created root and swap logical volumes. This run found a missing ext4 formatting tool. The live package list now explicitly includes e2fsprogs. |
| Remaining acceptance | Complete an install with the current image, boot it without media, verify graphical login and bindings, test TPM rejection on changed measurements, recovery, encrypted resume, updates and AC/battery transitions. Repeat firmware-dependent checks on Framework hardware. |

Pre-release candidates are development artifacts. The intended release includes verified source archives and third-party notices alongside the binary.

The follow-up disk test created the ext4 filesystem, populated the Ubuntu base and exposed a dangling resolver link inside the chroot. The installer now copies a regular resolver file and mounts an independent runtime filesystem for the target. The test then reached installation of Ubuntu's generic kernel. Quickshell loaded Omarchy's shell in an isolated Wayland session after the Qt 6.10 wallpaper syntax fix. These checks do not exercise graphics or sleep on the physical laptop.
