# 🔧 NixOS Launchers

> Effortlessly configure and manage your desktop’s default application launchers and MIME type associations on NixOS. This module automates directory setup, permissions, and .desktop entry deployment for a seamless user experience.

## 📦 Features

- 🔒 **Secure directories :** Creates and protects ```~/.config``` and ```~/.local/share/applications``` with correct ownership and permissions.

- 🛠️ **Launcher automation :** Installs and updates ```.desktop``` entries for selected applications on every system rebuild.

- 📑 **MIME defaults :** Applies a custom ```mimeapps.list``` to set default applications and URL handlers automatically.

- 🔄 **Idempotent :** Ensures consistent state across machines and rebuilds using NixOS activation scripts.

- 💾 **Manual backups :** Backup commands are provided in the documentation to preserve existing files before changes if needed.

- ⚙️ **Zero-friction setup :** Works out-of-the-box with sensible defaults.

- 🌐 **Protocol support :** Registers handlers for schemes like ```mailto:```, ```ftp:``` and types ```inode/directory```.

- 📦 **Dependency handling :** Automatically includes required packages in ```environment.systemPackages```.

## 📂 Repository structure

```bash
❯ tree -a -I ".git|.github"
.
├── configuration.nix
├── LICENSE.md
├── mimeapps.list
└── README.md

1 directory, 4 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

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

Open files, directories, or URLs with `xdg-open` to launch them in your configured defaults :

- 📝 **Neovim** - text editor : ```xdg-open file.txt```

- 🖼️ **EOG** - image viewer : ```xdg-open image.png```

- 📄 **Evince** - pdf viewer : ```xdg-open file.pdf```

- 🍭 **Lollypop** - audio player : ```xdg-open song.mp3```

- 🎥 **Celluloid** - video player : ```xdg-open video.mp4```

- 🌐 **Chromium** - web browser : ```xdg-open "https://github.com/typovrak```

- 📂 **Yazi** - file explorer : ```xdg-open .```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 💬 Community

Join our [Discord server](https://discord.gg/4Nq2cDAH) to chat, ask questions and share tips in **English** or **French**.

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
