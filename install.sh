#!/bin/bash
# install.sh

DESTINATION="/usr/local/bin/kit-proxy"

# Check if the script is being run with sudo
if [[ $EUID -ne 0 ]]; then
   echo "Please run this part of the script as root using 'sudo'."
   exit 1
fi

echo "Downloading kit-proxy from GitHub..."
if ! curl -L "https://raw.githubusercontent.com/101ta28/kit-proxy/main/kit-proxy.sh" -o "${DESTINATION}"; then
    echo "Error: Failed to download kit-proxy. Please check your internet connection."
    exit 1
fi

echo "Making kit-proxy executable..."
chmod +x "${DESTINATION}"

# Drop down to the original user for setting up the alias
if [ "$SUDO_USER" ]; then
    ORIGINAL_USER=$SUDO_USER
else
    ORIGINAL_USER=$(whoami)
fi

echo "Setting up alias for kit-proxy to source it..."

# Check and set alias for bash
if sudo -u $ORIGINAL_USER test -f "${HOME}/.bashrc"; then
    sudo -u $ORIGINAL_USER sh -c "echo \"alias kit-proxy='source ${DESTINATION}'\" >> \"${HOME}/.bashrc\""
    echo "Added alias to .bashrc"
fi

# Check and set alias for zsh
if sudo -u $ORIGINAL_USER test -f "${HOME}/.zshrc"; then
    sudo -u $ORIGINAL_USER sh -c "echo \"alias kit-proxy='source ${DESTINATION}'\" >> \"${HOME}/.zshrc\""
    echo "Added alias to .zshrc"
fi

echo "kit-proxy has been installed! Please restart your shell or source your configuration file."
