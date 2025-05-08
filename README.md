# 🔧 NixOS Launchers

> Effortlessly configure and manage your desktop’s default application launchers and MIME type associations on NixOS. This module automates directory setup, permissions, and .desktop entry deployment for a seamless user experience.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

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
TODO: need better comments here

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

## ❓ User questions & resolved issues

❌ No issues have been reported yet.

*If you encounter a problem, please open an [issue](issues) or submit a [pull request](pulls) to document the fix.*

## 📚 Learn more

- 📂 [XDG base directory specification](https://wiki.archlinux.org/title/XDG_Base_Directory) : Explains where config files and app data should live.
- 🧩 [MIME types and default applications](https://wiki.archlinux.org/title/Default_applications) : Learn how Linux associates file types with apps via ```mimeapps.list```.
- 🖱️ [Desktop entry specification](https://specifications.freedesktop.org/desktop-entry-spec/latest/) : Official freedesktop.org spec for ```.desktop``` launcher files.
- 🔗 [XDG utilities](https://wiki.archlinux.org/title/Xdg-utils) : Overview of tools like ```xdg-open``` to open files with the default application.
- 🐧 [NixOS MIME & desktop integration](https://nixos.org/manual/nixos/stable/options.html#opt-xdg.mime.defaultApplications) : How NixOS handles MIME types and desktop entries declaratively.

TODO: update links and content for better quality

TODO: add fork section for customization

TODO: rewrite for saying that customization works only on fork for better experience and reusability for the user.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 💬 Join the Typovrak community on Discord 🇫🇷
> "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe."
> ― Albert Einstein

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://discord.gg/4Nq2cDAH)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
