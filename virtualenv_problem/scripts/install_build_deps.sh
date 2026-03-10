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
    software-properties-common \
    python3-pip

echo ""
echo "Adding deadsnakes PPA for Python 3.11..."
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update

echo "Installing Python 3.11..."
sudo apt-get install -y \
    python3.11 \
    python3.11-venv \
    python3.11-dev

echo ""
echo "Build dependencies installed successfully."
