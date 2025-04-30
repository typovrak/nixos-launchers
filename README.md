# NixOS Launchers

> Effortlessly configure and manage your desktop’s default application launchers and MIME type associations on NixOS. This module automates directory setup, permissions, and .desktop entry deployment for a seamless user experience.

## 📑 Table of Contents

## 📦 Features

- 🔒 **Secure directories :** Creates and protects ```~/.config``` and ```~/.local/share/applications``` with correct ownership and permissions.

- 🛠️ **Launcher automation :** Installs and updates ```.desktop``` entries for selected applications on every system rebuild.

- 📑 **MIME defaults :** Applies a custom ```mimeapps.list``` to set default applications and URL handlers automatically.

- 🔄 **Idempotent :** Ensures consistent state across machines and rebuilds using NixOS activation scripts.

- 💾 **Manual backups :** Backup commands are provided in the documentation to preserve existing files before changes if needed.

- ⚙️ **Zero-friction setup :** Works out-of-the-box with sensible defaults.

- 🌐 **Protocol support :** Registers handlers for schemes like ```mailto:```, ```ftp:``` and types ```inode/directory```.

- 📦 **Dependency handling :** Automatically includes required packages in ```environment.systemPackages```.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```.<br/>
See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/mimeapps.list{,.bak}
cp ~/.local/share/applications/*.desktop{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-launchers = fetchGit {
    url = "https://github.com/typovrak/nixos-launchers.git";
    ref = "main";
    rev = "744197b2e31c2d6a0e1885cf87930e73f1b6ded1"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-launchers}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

### 1. Yazi
```bash
xdg-open .
```

add video

### 2. Neovim
```bash
echo "test" > test.txt
xdg-open test.txt
```

add video

### 3. Chromium
```bash
xdg-open "https://github.com/typovrak"
```

add video


## ❤️ Support
If this module saved you time, please ⭐️ the repo and share feedback.

## 📝 License
Distributed under the [MIT License](LICENSE.md).

## 📜 Code of Conduct
This project follows the [Contributor Covenant](CODE_OF_CONDUCT.md).

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! See CONTRIBUTING.md and issues.

Made with 💜 by typovrak
