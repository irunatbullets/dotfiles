#!/usr/bin/env bash

NVM_DIR="$HOME/.nvm"

if [ ! -d "$NVM_DIR" ]; then
    echo "Installing nvm..."
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
else
    echo "nvm is already cloned"
fi

# Checkout the latest released tag
(
    cd "$NVM_DIR" \
    && git fetch --tags \
    && LATEST_TAG=$(git describe --abbrev=0 --tags --match "v[0-9]*") \
    && git checkout "$LATEST_TAG"
)

echo "nvm installed at $NVM_DIR (tag: $(git -C "$NVM_DIR" describe --tags))"

