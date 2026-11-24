---
name: framework-hardware
description: Diagnose the hardware, sleep path and Omarchy session on this Framework Ubuntu installation when asked to configure or troubleshoot the laptop.
---

Start with `framework-hardware-report` for kernel, BIOS, display, power and sleep capabilities. Use `hyprctl -j monitors` and `hyprctl configerrors` inside the active graphical session. Check `wpctl status` for PipeWire routing, `nmcli device status` for networking and `powerprofilesctl get` for the active power profile. The Omarchy topic guides in /usr/share/omarchy/default/agents/skills/omarchy describe the shell IPC, themes and plugins. Local user overrides live in ~/.config/hypr and ~/.config/omarchy.

This build uses Ubuntu packages and Ubuntu boot integration. Use apt-cache policy to identify the archive providing a component. For suspend or resume failures, compare the previous and current boot journals, the kernel sleep states and the disk-backed swap target. The sleep panel selects a profile from UPower. Its first three timers count from last input and its hibernate delay begins at suspend.

For Codex allowance, use the Omarchy agents panel or the usage collector in /usr/share/omarchy/bin/omarchy-agent-usage-codex with --limits-only. Use update-codex for a requested CLI upgrade. Use prepare-firefox-bridge after GitHub sign-in when the owner requests browser control. The extension is loaded per Firefox session.
