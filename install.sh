#!/bin/bash
# install.sh

DESTINATION="/usr/local/bin/kit-proxy"

echo "Downloading kit-proxy from GitHub..."
curl -L "https://raw.githubusercontent.com/101ta28/kit-proxy/main/kit-proxy" -o "${DESTINATION}"

echo "Making kit-proxy executable..."
chmod +x "${DESTINATION}"

echo "kit-proxy has been installed!"
