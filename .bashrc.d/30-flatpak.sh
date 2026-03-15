# Add Flatpak apps to XDG_DATA_DIRS if flatpak exists
if command -v flatpak >/dev/null 2>&1; then
    export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"
fi

