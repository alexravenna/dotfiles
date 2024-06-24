#!/bin/sh

# Add mise CLI
curl https://mise.run | sh

# Make mise install the tools from .mise.toml
mise install