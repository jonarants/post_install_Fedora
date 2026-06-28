# post_install_Fedora

A collection of Bash scripts to automate the installation of common applications on **Fedora 44 KDE Plasma** after a fresh install. Instead of manually tracking down repositories and running commands one by one, just run the relevant script and get on with your life.

---

## Requirements

- Fedora 44 (KDE Plasma)
- `sudo` privileges
- Internet connection
- For DaVinci Resolve: the installer file (`DaVinci_Resolve_21.0.1_Linux.run`) must be downloaded manually from [Blackmagic Design's website](https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion) and placed in your working directory before running the script

---

## Scripts

### `installchromeFedora.sh` — Google Chrome

Installs Google Chrome Stable via the official Fedora workstation repositories.

**What it does:**
1. Installs `fedora-workstation-repositories`
2. Enables the `google-chrome` repository
3. Installs `google-chrome-stable`

```bash
bash installchromeFedora.sh
```

---

### `installcode.sh` — Visual Studio Code

Installs VS Code by importing Microsoft's GPG key, adding the official VS Code RPM repository, and installing the `code` package.

**What it does:**
1. Imports Microsoft's signing key
2. Adds the VS Code yum repository to `/etc/yum.repos.d/vscode.repo`
3. Runs `dnf check-update` and installs `code`

```bash
bash installcode.sh
```

---

### `installdavinciresolve.sh` — DaVinci Resolve (via DavinciBox)

Installs DaVinci Resolve 21.0.1 inside a [Distrobox](https://github.com/89luca89/distrobox)/Podman container using the [DavinciBox](https://github.com/zelikos/davincibox) project. This is the recommended approach for Fedora due to glibc/library compatibility issues.

**What it does:**
1. Installs `distrobox`, `podman`, `lshw`, `git`
2. Clones the `davincibox` repository
3. Moves the DaVinci Resolve installer into the `davincibox` directory
4. Runs `setup.sh` to create the container and install Resolve inside it

> **⚠️ Pre-requisite:** Download `DaVinci_Resolve_21.0.1_Linux.run` from [Blackmagic Design](https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion) and place it in the same directory where you'll run the script.

```bash
bash installdavinciresolve.sh
```

---

### `installdiscord.sh` — Discord

Installs Discord via RPM Fusion (free + nonfree repositories).

**What it does:**
1. Adds RPM Fusion free and nonfree repositories for the current Fedora release
2. Installs `discord`

```bash
bash installdiscord.sh
```

---

### `installsteam.sh` — Steam

Installs Steam via the RPM Fusion nonfree repository.

**What it does:**
1. Enables the `rpmfusion-nonfree-steam` repository
2. Installs `steam`

```bash
bash installsteam.sh
```

---

### `installxone.sh` — Xbox Wireless Dongle Driver (xone)

Installs the [xone](https://github.com/medusalix/xone) kernel driver via DKMS to enable support for the Xbox Wireless USB dongle (used for Xbox One/Series controllers).

**What it does:**
1. Installs build dependencies: `dkms`, `make`, `kernel-devel`, `kernel-headers`, `git`, `cabextract`
2. Clones the `xone` repository
3. Runs the installer with `--release` flag
4. Downloads and installs the required firmware via `xone-get-firmware.sh`
5. Cleans up the cloned repository

```bash
bash installxone.sh
```

> **Note:** The script runs `sudo sh install.sh` from inside the cloned `xone` directory. Make sure your kernel headers match your running kernel (`uname -r`). If you've updated the kernel recently, reboot before running this script.

---

## Usage

Clone the repository and make scripts executable:

```bash
git clone https://github.com/jonarants/post_install_Fedora.git
cd post_install_Fedora
chmod +x *.sh
```

Then run the scripts you need:

```bash
bash installchromeFedora.sh
bash installcode.sh
bash installdiscord.sh
bash installsteam.sh
bash installxone.sh
# See DaVinci Resolve prerequisites before running:
bash installdavinciresolve.sh
```

---

## Notes

- Scripts are designed to be run individually, not as a single combined installer.
- All scripts use `sudo` internally — you will be prompted for your password.
- Tested on Fedora 44 KDE Plasma. Results on other Fedora spins may vary.

---

## Author

[jonarants](https://github.com/jonarants)
