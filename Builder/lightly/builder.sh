#!/bin/bash

# Exit the script if any command fails
set -e

# Clone the Lightly repository
echo "Cloning the pyod repository..."
git clone https://github.com/lightly-ai/lightly.git
cd lightly

# Check out the master branch (pinned to the latest release)
echo "Checking out the master branch..."
git checkout master

# Create a Python virtual environment named 'venv'
echo "Creating a virtual environment named 'venv'..."
python3 -m venv venv  # Ensure Python 3 or higher is installed

# Activate the virtual environment
echo "Activating the virtual environment..."
source venv/bin/activate
pip install pytest

# Install Pyro
echo "Installing lightly..."
pip install -e ".[dev]"
pip install pytest
echo "lightly installation complete. To activate the virtual environment in future sessions, run:"
echo "source ./venv/bin/activate"
