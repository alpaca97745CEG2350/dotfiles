#!/bin/bash

# Checks **Effective User ID** EUID.
# If the EUID is not 0 (root), exit and prompt the user.
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script requires sudo or root privileges. Please run with sudo."
    exit 1
fi

# 2. Check that the system package manager is 'apt'
# If the 'apt' command is not found, exit and prompt the user.
if ! command -v apt &> /dev/null; then
    echo "Error: This script uses the 'apt' package manager, which is not available on this system."
    exit 1
fi

# 3. Check for name conflicts
# If the 'aws' command already exists, abort to prevent overwriting system behavior.
if command -v aws &> /dev/null; then
    echo "Error: A command named 'aws' already exists on this system. Name conflict occurred. Exiting to prevent unintended changes."
    exit 1
fi

# 4. Provide information and prompt the user
echo "This script will install the official AWS Command Line Interface (AWS CLI v2)."
echo "It will also silently install required dependencies: 'curl' and 'unzip'."
read -p "Do you want to proceed with the installation? (y/n): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Installation aborted by user."
    exit 0
fi

# 5. Silently install dependencies and the software
echo "Installing dependencies silently..."
# -qq suppresses apt output, -y assumes yes to prompts, > /dev/null throws away the standard output
apt update -qq
apt install -y curl unzip > /dev/null 2>&1

echo "Downloading and installing AWS CLI v2 silently..."
# Move to the temporary directory to keep the filesystem clean
cd /tmp || exit

# Download the installation zip silently (-s)
curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip quietly (-q)
unzip -q awscliv2.zip

# Run the official AWS install script silently
./aws/install > /dev/null 2>&1

# Clean up the temporary downloaded files
rm -rf awscliv2.zip aws/

# 6. Installation complete prompt
echo "---------------------------------------------------"
echo "Installation complete!"
echo "To verify the installation and try it out, please run:"
echo "aws --version"
echo "---------------------------------------------------"

![https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions](AWS CLI intalling or updating to the latest version)
Generative AI was used writing this script. What are the commands needed to write a script that performs [insert task here]?