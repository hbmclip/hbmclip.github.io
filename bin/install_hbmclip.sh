#!/bin/bash

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "Error: 'curl' is not installed."
    echo "Please install curl before continuing."
    echo "Debian/Ubuntu: sudo apt install curl"
    echo "Fedora: sudo dnf install curl"
    exit 1
fi

# Binary information
BIN_NAME="hbmclip"
BIN_URL="https://hbmclip.github.io/bin/$BIN_NAME"
TEMP_FILE="${BIN_NAME}_download"

# Required packages
DEBIAN_PKGS="libcurl4-gnutls-dev libssl-dev libpq-dev libx11-dev libmysqlclient-dev"
FEDORA_PKGS="libcurl-devel openssl-devel postgresql-devel libX11-devel mysql-devel"

# Detect distribution
if [ -f /etc/debian_version ]; then
    DISTRO="debian"
    INSTALL_CMD="apt install -y"
    PKGS=$DEBIAN_PKGS
elif [ -f /etc/fedora-release ] || grep -q "Fedora" /etc/os-release; then
    DISTRO="fedora"
    INSTALL_CMD="dnf install -y"
    PKGS=$FEDORA_PKGS
else
    echo "Unsupported distribution. Only Debian/Ubuntu and Fedora are supported."
    exit 1
fi

echo "Detected distribution: $DISTRO"

# Check and install missing packages
echo "Checking required packages..."
MISSING_PKGS=()

for pkg in $PKGS; do
    if ! dpkg -s "$pkg" &> /dev/null && ! rpm -q "$pkg" &> /dev/null; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    echo "Installing missing packages: ${MISSING_PKGS[*]}"
    sudo $INSTALL_CMD ${MISSING_PKGS[*]}
else
    echo "All required packages are already installed."
fi

# Prompt for destination directory
read -p "Enter the directory where the binary will be installed [/usr/local/bin]: " DEST_DIR
DEST_DIR=${DEST_DIR:-/usr/local/bin}

# Create directory if it doesn't exist
if [ ! -d "$DEST_DIR" ]; then
    echo "Creating directory $DEST_DIR"
    mkdir -p "$DEST_DIR" || { echo "Failed to create directory."; exit 1; }
fi

# Download the binary to a temporary file
echo "Downloading the binary..."
curl -L -o "$TEMP_FILE" "$BIN_URL" || { echo "Failed to download the binary."; exit 1; }

chmod +x "$TEMP_FILE"

# Move and rename the binary
if [ "$DEST_DIR" = "/usr/local/bin" ]; then
    echo "Root password required to move the binary to /usr/local/bin..."
    sudo mv "$TEMP_FILE" "$DEST_DIR/$BIN_NAME"
else
    mv "$TEMP_FILE" "$DEST_DIR/$BIN_NAME" || { echo "Failed to move the binary."; exit 1; }
fi

echo "Installation completed successfully! You can use '$BIN_NAME' from '$DEST_DIR'."

