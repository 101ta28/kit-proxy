#!/bin/bash
# install.sh

DESTINATION="/usr/local/bin/kit-proxy"

echo "Downloading kit-proxy from GitHub..."
curl -L "https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/kit-proxy/main/kit-proxy" -o "${DESTINATION}"

echo "Making kit-proxy executable..."
chmod +x "${DESTINATION}"

echo "Setting up alias for kit-proxy..."

# Check and set alias for bash
if [ -f "${HOME}/.bashrc" ]; then
    echo "alias kit-proxy='${DESTINATION}'" >> "${HOME}/.bashrc"
    echo "Added alias to .bashrc"
fi

# Check and set alias for zsh
if [ -f "${HOME}/.zshrc" ]; then
    echo "alias kit-proxy='${DESTINATION}'" >> "${HOME}/.zshrc"
    echo "Added alias to .zshrc"
fi

echo "kit-proxy has been installed! Please restart your shell or source your configuration file."
