#!/bin/bash
# Install build dependencies required for compiling Python and common extensions

echo "Updating package list..."
sudo apt-get update

echo "Installing build dependencies..."
sudo apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    ca-certificates \
    software-properties-common

echo ""
echo "Build dependencies installed successfully."
