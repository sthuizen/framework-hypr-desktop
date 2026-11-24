# Installation design and acceptance

## Decisions

| Variable | Selection |
|---|---|
| First machine | Framework Laptop 13 AMD 7040 with Radeon integrated graphics, UEFI and TPM 2.0. Whole-disk replacement of Bluefin when the owner boots the finished installer. |
| Distribution | Ubuntu 26.04.1 amd64 with normal Ubuntu kernel and security updates. Bootstrap the Ubuntu base from its signed package archive using a Debian live installer. Include NetworkManager, Wi-Fi firmware, PipeWire, WirePlumber, BlueZ, portals, polkit, power profiles, fwupd and laptop brightness support. |
| Desktop | Actual Omarchy 4.5.0 Quickshell, native panels, bar, idle, lock, launcher, workspace and theme services. Test stock dwindle layout, animations, fractional scale, external monitor hotplug and screenshot / screencast. |
| System integration | Evaluate a pinned desktop stack with Hyprland 0.57.2. Resolve QuickShell's Qt private ABI, Wayland/PAM modules, graphics driver and shell imports as one compatible set. Use system packages where compatible. Replace Arch package, update, bootloader and first-run operations with Ubuntu equivalents before exposing those menu actions. |
| Login | Graphical greeter with the Hyprland session selected. Require local account authentication at login and after wake. TPM unlock applies to storage. No autologin. |
| Plugins | Enable Sleep Guardian, Power Center and Media Deck. Audit all candidates. See plugin inventory. |
| Applications | Firefox, Zed, foot, Nautilus, cliamp, mpv and LibreOffice. Test desktop entries, terminal commands, MIME and URI handlers, XDG terminal and Omarchy launchers after a fresh install. |
| Keyboard | Super plus J/K/L/semicolon and arrows. Shift moves the window. See key map below. Start with the Ubuntu keyboard defaults. |
| Sleep priority | Prefer hibernation. Review the boot-security trade-off with the owner before changing firmware or the accepted unlock policy. |
| Locale / identity | The installer asks for the account and passphrases. Initial hostname is framework-hypr, default locale en_US.UTF-8 and time zone UTC. |
| Installation | Select target disk interactively with a final erase confirmation. Use only a disposable virtual disk in automated testing. |
| Updates | Keep package pins, upstream license texts and a matching source inventory per release. Test compositor, Qt, Quickshell and plugin upgrades together. |
| Distribution | Separate source repository under sthuizen and release assets. Prefer a small, independently built bootstrap ISO that obtains verified Ubuntu inputs during installation if redistributing a modified Canonical image requires permission. Document connectivity requirements before release. |

## Storage and power

Prototype GPT with an EFI System Partition and LUKS2 storage for root and persistent swap. A separate swap logical volume gives initramfs a stable resume target. Budget 20 GiB for swap on the first machine and recalculate after a RAM upgrade. Record the volume identifiers at install time. Supply a recovery passphrase generated or entered on the target. Exercise recovery with the TPM unavailable and test a kernel update before enabling unattended disk unlock. Bind TPM release to the approved measured boot path, including the kernel and initramfs. Document recovery and reenrollment after firmware changes. Ubuntu Desktop's snap-based hardware-backed installer and a custom LUKS2/initramfs setup have different unlock and update paths.

| Power | Screensaver | Secure lock | Suspend | Hibernate after entering suspend |
|---|---:|---:|---:|---:|
| Battery | 3 min | 5 min | 15 min | 30 min |
| Mains | 10 min | 15 min | 60 min | 120 min |

The first three deadlines count from last input. At the battery defaults hibernation occurs approximately 45 minutes after the last input, on mains approximately 180 minutes. Sleep Guardian owns the editor and Omarchy owns saver and lock. Add a narrow system integration for the selected post-suspend delay. Use logind inhibitors and require a confirmed session lock. Test power changes before and during suspend, lid close with and without a dock, low battery, RTC wake, wake cancellation and recovery after an unsuccessful hibernate. Show unsupported modes in the panel. Check kernel lockdown and resume support on the installed Ubuntu kernel. Encrypted swap alone does not establish that the resume image can pass kernel lockdown.

## Key map

| Keys (Super modifier) | Intended action |
|---|---|
| Return / D / Shift+Q | Terminal / application launcher / close window |
| J K L semicolon or arrows | Focus left, down, up, right. Shift moves the active window. |
| 1 through 0 / Shift+number | Select workspace 1 through 10 / move active window there |
| H / V | Preselect horizontal / vertical split for the next window |
| F / Shift+Space / Space | Fullscreen / toggle floating / switch focus between tiled and floating |
| R | Resize mode, directional keys resize, Enter or Escape exits |
| Minus / Shift+minus | Show scratchpad / send active window there |
| Shift+C / Shift+E | Reload configuration / confirmed session exit |
| Ctrl+Alt+L / Print / media keys | Lock, screenshot, volume, playback and brightness |
| Super+Escape | Omarchy system menu |
| W, S, E, A, Shift+R | Review tabbed groups, stacking, layout reset, parent focus and in-place restart individually. Hyprland dwindle lacks i3's complete container tree. Avoid destructive substitutes. |

## Release evidence

1. Verify base media signature and digest. Record build recipe, commit IDs, checksums, package versions, licenses and corresponding sources for redistributed contents.
2. Boot ISO with UEFI, follow installation on a new virtual disk and reboot with the ISO removed. Check greeter, account creation, desktop, default handlers and updated-kernel boot.
3. Boot with a virtual TPM, exercise recovery and verify the keys stay out of media and logs. Verify encrypted swap and test restoration of a running process across hibernate.
4. On the Framework, verify Wi-Fi, audio, screen sharing, GPU acceleration, brightness, suspend and resume. Repeat the timer sequence on AC and battery and record the lock screen before login after resume.
5. Publish tagged source and release assets after checking licenses, public branding and hashes. Re-download and verify the published image. Record any checks still requiring physical hardware.

## Boot-mode experiment on 24 November 2026

Both tests booted the same Canonical kernel from the verified 26.04.1 server ISO (SHA-256 cc8a95cde20f6ced61a322420de00f10cc3c90ced545daa46cb9c1a117f1d927). QEMU q35 used OVMF and a read-only test initramfs. It mounted sysfs and securityfs, read the exposed kernel capabilities and powered off the VM.

| OVMF variable store | Kernel | /sys/power/state | Lockdown |
|---|---|---|---|
| Microsoft keys enrolled, Secure Boot enabled | 7.0.0-30-generic | freeze mem | integrity |
| Empty enrollment, Secure Boot disabled | 7.0.0-30-generic | freeze mem disk | none |

The owner selected development of the hibernation-first profile. Test measured boot with edited EFI, kernel, initramfs and command line, TPM absent, fallback credential and kernel updates. The state probe alone cannot establish that hibernation restores memory. Firmware changes and physical installation are separate actions on the target.

## Codex integration

Seed the official Codex CLI at a pinned release and expose an explicit update action. The first integration target is 0.172.0. The update command installs the latest stable npm version in the user's home and reports the installed version. Add Node 20+ to the system. Firefox Browser Control needs the extension payload, per-user Firefox native host and matching Codex MCP plugin. Prefer native Firefox for the standard Mozilla host location. Load the staged manifest through Firefox's temporary add-on UI. Firefox removes it on restart. Test a new Codex session, connect, disconnect and restart Firefox. Check whether the backend implements the RemoteDesktop portal before offering native input. Browser sign-in and Codex credentials belong to the installed user.
