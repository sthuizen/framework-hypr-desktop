# Installing on the Framework Laptop 13 AMD 7040

Download the ISO and SHA256SUMS from the same release. From their directory run `sha256sum -c SHA256SUMS`. Write the ISO as a disk image to a spare USB stick. Fedora Media Writer's “Select .iso file” option works with custom images.

1. Back up the existing system to a separate device and verify that you can read the backup. The installer formats the entire selected disk.
2. Open Framework firmware settings with F2. The hibernation-first configuration requires UEFI with Secure Boot disabled. That permits unsigned boot software to run. TPM auto-unlock is separately bound to boot measurements and expects the same measured boot path on subsequent starts.
3. Use F12 to boot the USB. Choose **Connect to Wi-Fi or Ethernet** and activate a connection. The installer downloads Ubuntu and applications during installation. Keep mains power connected.
4. Choose **Install on a whole disk**. Match the listed size and model to the intended drive. Enter the disk path and login name, then type the displayed erase confirmation. Choose a unique disk recovery passphrase, store it outside the laptop, and enter it again to open the volume. Choose the desktop login password when prompted.
5. If application installation fails, repair the connection and select **Install on a whole disk** again during the same live session. The installer resumes a prepared target when its saved root UUID matches the mounted volume.
6. Shut down, remove the USB, boot the installed system using the recovery passphrase and log in. Open **Finish setup** with **Super+F1**. Select **Enroll disk TPM** to add the auto-unlock method. Keep the recovery passphrase for boot, firmware and kernel changes. Test a second boot before relying on automatic unlocking.
7. **Super+Return** opens foot, **Super+D** opens applications, and **Super+Ctrl+Return** opens Codex. In **Finish setup**, choose GitHub sign-in and Codex sign-in as needed. Prepare the private Firefox extension once. Use **Load temporary Firefox extension** in each Firefox session where browser control is wanted.

## Power controls

Open **Edit sleep timers** to change Sleep Guardian's battery or AC screensaver, lock and sleep deadlines. Use **Edit hibernation delays** to change the number of minutes between entering suspend and hibernating. The system picks that delay from the power source at suspend entry. The kernel and firmware must support the RTC wakeup. Automatic hibernation can happen sooner on a critically low battery.

## Recovery and updates

Use the recovery passphrase when TPM unlock fails. A firmware or kernel upgrade can change the measured boot path. Verify the intended upgrade and re-enrol from that approved boot. The EFI System Partition holds the bootloader and unified kernel images. Ubuntu root, user files and persistent swap are in the LUKS2 container. Keep sufficient free space on the EFI partition for kernel updates. The release test record distinguishes VM results from physical hardware validation.
