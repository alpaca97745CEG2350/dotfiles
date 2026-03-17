# Dotfiles - Bash Aliases Setup

This repository contains personal Bash aliases and a setup script to automatically configure them on a Linux system.

The setup script creates a symbolic link to the `.bash_aliases` file and ensures that your `.bashrc` loads it.

---

## Files

### `.bash_aliases`

Contains custom shell aliases for:

* **Container tools**

  * Run tools like `kali`, `john`, `binwalk`, and `volatility2` using Singularity containers.

* **Package management shortcuts**

  * `update` → `sudo apt update && sudo apt upgrade -y`
  * `install` → `sudo apt install`
  * `remove` → `sudo apt remove`

* **Git shortcuts**

  * `gs` → `git status`
  * `ga` → `git add`
  * `gc` → `git commit -m`
  * `gco` → `git checkout`
  * `gb` → `git branch`

* **Directory shortcuts**

  * `web` → `cd /var/www/html`

---

### `setup.sh`

Automates installation of the aliases.

The script:

1. Defines the location of the dotfiles repository.
2. Backs up any existing `~/.bash_aliases` file.
3. Creates a **symbolic link** from the repository to `~/.bash_aliases`.
4. Ensures `.bashrc` loads the aliases file.
5. Prompts you to reload your shell.

---

## Installation

Clone your dotfiles repository:

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/github/dotfiles
```

Run the setup script:

```bash
bash setup.sh
```

Reload your shell:

```bash
source ~/.bashrc
```

---

## Notes

* Existing `.bash_aliases` files are automatically backed up to:

```
~/.bash_aliases.bak
```

* The setup script safely avoids adding duplicate lines to `.bashrc`.

---

## Requirements

* Linux
* Bash
* `apt` package manager (Debian/Ubuntu based systems)
* Singularity (for container-based tools)

---
* [GitHub: Dotfiles](https://dotfiles.github.io/) - Used as a general reference for understanding the concept of dotfiles repositories, why developers use them, and best practices for keeping system configurations version-controlled.  
* [DigitalOcean: An Introduction to Useful Bash Aliases](https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions) - Provided inspiration for structuring the `.bash_aliases` file and understanding the strict syntax rules (like removing spaces around the equals sign) required for custom terminal shortcuts.  
* [Linuxize: How to Create Symbolic Links (`ln`)](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/) - Used to understand the mechanics of the `ln -sf` command utilized in the deployment script to safely link repository files to the home directory without breaking existing configurations.  
* [Git Documentation: Git Aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases) - Served as a reference for the standard Git shortcut commands (`status`, `add`, `commit`, `checkout`, `branch`) incorporated into the environment.  
* [Google Gemini 3.1 Pro](https://gemini.google.com/) - Generative AI used to brainstorm bash alias concepts, generate the initial idempotency logic for the deployment script (ensuring `.bashrc` isn't filled with duplicate lines), and troubleshoot symbolic link behaviors.