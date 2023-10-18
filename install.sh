#!/bin/bash
# install.sh

DESTINATION="/usr/local/bin/kit-proxy"
GITHUB_USERNAME="101ta28"

echo "Downloading kit-proxy from GitHub..."
curl -L "https://raw.githubusercontent.com/${GITHUB_USERNAME}/kit-proxy/main/kit-proxy" -o "${DESTINATION}"

echo "Making kit-proxy executable..."
chmod +x "${DESTINATION}"

echo "Setting up alias for kit-proxy to source it..."

# Check and set alias for bash
if [ -f "${HOME}/.bashrc" ]; then
    echo "alias kit-proxy='source ${DESTINATION}'" >> "${HOME}/.bashrc"
    echo "Added alias to .bashrc"
fi

# Check and set alias for zsh
if [ -f "${HOME}/.zshrc" ]; then
    echo "alias kit-proxy='source ${DESTINATION}'" >> "${HOME}/.zshrc"
    echo "Added alias to .zshrc"
fi

echo "kit-proxy has been installed! Please restart your shell or source your configuration file."

