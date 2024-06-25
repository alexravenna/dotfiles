#!/bin/sh

# Add mise CLI and activate it
curl https://mise.run | sh
echo 'eval "$(mise activate bash)"' >> ~/.bashrc

# Make mise install the tools from .mise.toml
mise install --yes