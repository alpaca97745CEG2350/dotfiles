This contains a bash script to automate the installation of the official AWS Command Line Interface (AWS CLI v2) on Debian and Ubuntu-based Linux systems.

## Features

- **Script Information**:
  - The script is run with `sudo` or root privileges.
  - Verifies the presence of the `apt` package manager.
  - Checks for existing `aws` command installations to prevent unintended overwrites.
- **Safety First**: Prompts the user for explicit confirmation before proceeding with any system changes.
- **Automated Dependencies**: Silently installs necessary prerequisites (`curl` and `unzip`) using `apt`.
- **Clean Execution**: Downloads and extracts the AWS CLI binaries in the `/tmp` directory and automatically cleans up all installation artifacts once finished.

## Prerequisites

- A Linux system using the `apt` package manager (e.g., Ubuntu, Debian).
- Sudo/root access.
- Internet connectivity to download the AWS CLI binaries.

## Usage

1. Save the provided bash script to a file, for example: `install_aws_cli.sh`.
2. Make the script executable:
Code output
File created successfully.

```bash
   chmod +x install_aws_cli.sh