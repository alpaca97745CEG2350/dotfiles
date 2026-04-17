# Dotfiles & System Configurations

This repository contains automated setup scripts and configuration files (dotfiles) designed to rapidly provision a Linux environment. It centralizes custom bash aliases, text editor settings, and essential system package installations to streamline your development.

## Repository Structure

The repository is organized into three independent modules, each serving a specific configuration purpose:

1. **`homefiles/`**: Contains customized Bash aliases to accelerate package management, Git workflows, and containerized cybersecurity tools (e.g., Kali, John the Ripper, Volatility, Binwalk). Includes an automated deployment script that safely links to your home directory.
2. **`sys-installs/`**: Holds system-level installation scripts, specifically featuring an automated, dependency-aware installer for the official AWS Command Line Interface (AWS CLI v2).
3. **`vim-config/`**: Provides a robust, developer-ready `.vimrc` environment. It includes a script that automatically installs the Vundle plugin manager along with several utility plugins (indent guides, fugitive) and the jellybeans theme.

---

## Prerequisites

To utilize these configurations, your system should meet the following requirements:
* A Linux-based operating system (Debian/Ubuntu).
* `git` installed to clone the repository.
* Administrative (`sudo`) privileges for package installations and system-level scripts.

---

## Initial Setup

To ensure all deployment scripts resolve their relative file paths correctly, you must clone this repository into a specific directory structure (`~/github/dotfiles`).

### Step 1: Clone the Repository
Execute the following commands to create the directory and download the repository:

```bash
mkdir -p ~/github
cd ~/github
git clone [https://github.com/alpaca97745CEG2350/dotfiles.git](https://github.com/alpaca97745CEG2350/dotfiles.git)
cd dotfiles