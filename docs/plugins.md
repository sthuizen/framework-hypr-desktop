# Plugin selection and integration checks

[Pinned public revisions](../profile/plugins.json) record the code reviewed for this build. Three additions are selected for first login. This first pass checks the manifests, provider dependencies and available automated tests. Real shell and hardware interaction still need a graphical session.

| Addition | Default | Review result |
|---|---|---|
| Sleep Guardian | On | Its JS and Python suites passed in Ubuntu. The upstream hibernation probe assumes mkinitcpio. The Ubuntu port checks the running kernel, root system's resume UUID and active swap mapping. The systemd pre-start hook supplies the active AC/battery hibernation delay. |
| Power Center | On | Model and backend tests passed. Replace the bar's stock power entry. Preserve the upstream lock and inhibitor checks. Exercise each available action on the installed system. |
| Media Deck | On | All 14 model checks passed. Retain the first-party MPRIS service which supplies the panel. Validate Firefox, cliamp and mpv independently as player support can differ. |
| Audio Visualizer | Optional | Frame parsing tests passed. Test idle CPU and audio-device switching before enabling on battery. |
| Navbar Cat | Optional | Brain and cursor-helper tests passed. Code uses MIT terms and sprite assets carry separate public-domain provenance. |
| Symbolic Workspaces | Optional | QML replacement for the workspace bar widget. Test all ten i3 workspace shortcuts and external monitors. |
| System Pulse | Optional | All 44 model checks passed. Validate per-process display in an installed desktop. |
| Tray Icon Fallback | Conditional | Python resolver and management tests passed. Check the actual Qt build for the original stale-icon issue before installing. |
| Wallpaper Rotation | Optional | Timer and controller tests passed with a private XDG runtime directory in the Ubuntu container. Use one rotation scheduler per active theme. |
| Biblical Graphite | Optional theme | Includes a wallpaper catalog and a separate Omarchy MIT notice. Retain notices with the artwork. |
| Quattro Sunset | Preferred theme from earlier desktop | Upstream validation verified 20 PNG dimensions, checksums and SHA-256 hashes. |
