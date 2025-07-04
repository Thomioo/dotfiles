#!/bin/bash

# A simple function to map app class names to user-friendly names
rename_app() {
    case "$1" in
        "code") echo "VS Code" ;;
        "org.kde.konsole") echo "Konsole" ;;
        "org.prismlauncher.PrismLauncher") echo "Prism Launcher" ;;
        "org.gnome.TextEditor") echo "Notepad" ;;
        "com.obsproject.Studio") echo "OBS" ;;
        *) echo "${1^}" ;;  # Default: capitalize first letter
    esac
}

while true
do
    class=$(hyprctl activewindow -j | jq -r '.class')

    if [ "$class" != "null" ] && [ -n "$class" ]; then
        rename_app "$class"
    else
        echo ""
    fi

    sleep 0.1
done
:w

