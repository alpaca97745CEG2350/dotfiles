This repository contains a curated `.vimrc` configuration and an automated bash script to deploy it effortlessly to your system. It utilizes [Vundle](https://github.com/VundleVim/Vundle.vim) as the primary plugin manager to handle extensions and themes.

## Overview of Components

### 1. The Vim Configuration (`.vimrc`)
The provided configuration establishes a modern, developer-friendly Vim environment.

**Included Plugins:**
* **Vundle.vim**: The core plugin manager that maintains itself.
* **vim-indent-guides**: Visually displays indentation levels in code, making nested blocks easier to read.
* **jellybeans.vim**: A colorful, dark color scheme designed for long coding sessions.
* **vim-fugitive**: A premier, highly integrated Git wrapper for Vim.
* **sparkup**: A tool that allows you to write HTML code faster by expanding CSS-like selectors into full markup.

**Key Settings:**
* Sets Vim to `nocompatible` mode (disabling legacy Vi compatibility to enable modern features).
* Enables strict filetype detection, plugin loading, and indentation rules.
* Automatically sets the editor theme to `jellybeans`.

### 2. The Setup Script
The included bash script automates the tedious parts of configuring Vim on a new machine. It executes the following sequence:
1. **Verifies Source File**: Checks if the `.vimrc` exists in the expected local repository path (`~/github/dotfiles/vim-config/.vimrc`).
2. **Deploys Configuration**: Copies the `.vimrc` file into your home directory as `~/.vimrc`.
3. **Installs Vundle**: Checks if the Vundle directory exists (`~/.vim/bundle/Vundle.vim`). If missing, it automatically clones the official Vundle repository from GitHub.
4. **Bootstraps Plugins**: Launches Vim in unattended mode to run the `:PluginInstall` command. This downloads and installs all plugins defined in your `.vimrc`, then safely closes Vim.

---

## Installation Instructions

Follow these detailed steps to deploy this Vim configuration to your system.

### Step 1: Install Prerequisites
Ensure your operating system has both `git` and `vim` installed, as they are required to clone repositories and run the editor.

**Debian/Ubuntu:**  
`sudo apt update`  
`sudo apt install git vim -y`

### Step 2: Prepare the Directory Structure
The installation script explicitly expects the source files to be located in a specific directory path (`~/github/dotfiles/vim-config/`).

1. Create the necessary directory structure:
   ```bash
   mkdir -p ~/github/dotfiles/vim-config
   ```
2. Move or copy the provided `.vimrc` and the installation script (e.g., `config.sh`) into the newly created `vim-config` directory.

### Step 3: Execute the Setup Script
1. Navigate into the configuration directory:
   ```
   cd ~/github/dotfiles/vim-config
   ```
2. Grant execution permissions to the script:
   ```bash
   chmod +x config.sh
   ```
3. Execute the setup script:
   ```bash
   ./config.sh
   ```
4. The script will output its progress to the terminal. It will briefly launch Vim to install the plugins and close automatically. Wait for the script to print `COMPLETED`.

---

## Managing Plugins (Post-Installation)

Once the setup is complete, your Vim environment is fully configured. If you wish to add or remove plugins in the future, edit your `~/.vimrc` file and use Vundle's native commands directly inside Vim:

1. **Add a new plugin**: Add `Plugin 'Author/Repository'` to your `~/.vimrc` between the `vundle#begin()` and `vundle#end()` lines.
2. **Save and reload**: Save the file (`:w`) and reload the configuration (`:source %`).
3. **Run Vundle commands**:
   * `:PluginList` - Lists all currently configured plugins.
   * `:PluginInstall` - Installs newly added plugins.
   * `:PluginUpdate` - Updates existing plugins to their latest versions.
   * `:PluginClean` - Prompts you to delete unused plugins that have been removed from your `.vimrc`.