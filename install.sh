#!/bin/sh

# Add mise CLI and activate it
if ! command -v curl >/dev/null 2>&1; then
	echo "Error: curl is required but not installed." >&2
	exit 1
fi

tmp_script="$(mktemp)"
trap 'rm -f "$tmp_script"' EXIT

if ! curl -fsSL https://mise.run -o "$tmp_script"; then
	echo "Error: Failed to download mise installer." >&2
	exit 1
fi

if ! sh "$tmp_script"; then
	echo "Error: mise installer failed to run." >&2
	exit 1
fi

echo 'eval "$(mise activate bash)"' >> ~/.bashrc

# Make mise install the tools from .mise.toml
mise install --yes