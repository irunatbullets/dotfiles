#!/bin/bash
set -e

# Install PipeWire and PulseAudio compatibility
sudo apt update
sudo apt install -y pipewire pipewire-pulse wireplumber

# Enable and start user services
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# Test connection
if pactl info &>/dev/null; then
    echo "Audio server running. pactl is working!"
else
    echo "Warning: pactl cannot connect. Check PipeWire or PulseAudio."
fi

