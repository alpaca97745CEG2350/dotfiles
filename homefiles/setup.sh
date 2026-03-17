#!/bin/bash
#
# define paths
DOTFILEREPO="$HOME/github/dotfiles/homefiles"
ALIASES_FILE=".bash_aliases"
TARGET_LINK="$HOME/$ALIASES_FILE"
BASHRC="$HOME/.bashrc"

echo "Starting script..."

# Backup existing .bash_aliases if it exists
# Looks for a bash_aliases file in the home directory, if it finds one, it checks if it is a symbolic link. If it is not a symbolic link, it renames the existing file to .bash_aliases.bak.
if [ -f "$TARGET_LINK" ] && [ ! -L "$TARGET_LINK" ]; then
    echo "Backing up existing $TARGET_LINK to $TARGET_LINK.bak"
    mv "$TARGET_LINK" "$TARGET_LINK.bak"
fi

# CREATE SYMBOLIC LINK

echo "Creating symbolic link for $ALIASES_FILE"
ln -sf "$DOTFILEREPO/$ALIASES_FILE" "$TARGET_LINK"

# Safely append the sourcing logic to .bashrc
if grep -q "if \[ -f ~/$ALIASES_FILE \]; then" "$BASHRC"; then
    echo "Your ~/.bashrc is already configured to load $ALIASES_FILE."
else
    echo "Appending source configuration to ~/.bashrc..."
    cat <<EOF >> "$BASHRC"

# Load custom bash aliases from dotfiles repository
if [ -f ~/$ALIASES_FILE ]; then
    source ~/$ALIASES_FILE
fi
EOF
fi

# Remind the user to reload their shell
echo "Completed. Execute the following command to apply the changes: source ~/.bashrc"


