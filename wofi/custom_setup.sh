#!/bin/bash

selection=$(wofi --show dmenu,drun --prompt="Find something ")

# Exit if empty
[ -z "$selection" ] && exit

# If input starts with '?', do a Google search
if [[ "$selection" == \?* ]]; then
    query="${selection:1}"
    query=$(echo "$query" | sed 's/^ *//')
    encoded=$(printf '%s' "$query" | jq -s -R -r @uri)
    hyprctl dispatch exec "xdg-open \"https://www.google.com/search?q=$encoded\""
elif [[ "$selection" == \p* ]]; then
    query="${selection:1}"
    query=$(echo "$query" | sed 's/^ *//')
    encoded=$(printf '%s' "$query" | jq -s -R -r @uri)
    hyprctl dispatch exec "xdg-open \"https://www.perplexity.ai/?q=$encoded\""
elif [[ "$selection" == \.* ]]; then
    query="${selection:1}"
    query=$(echo "$query" | sed 's/^ *//')
    encoded=$(printf '%s' "$query" | jq -s -R -r @uri)
    hyprctl dispatch exec "xdg-open \"https://www.$encoded\""
elif [[ "$selection" == \yt* ]]; then
    query="${selection:2}"
    query=$(echo "$query" | sed 's/^ *//')
    encoded=$(printf '%s' "$query" | jq -s -R -r @uri)
    hyprctl dispatch exec "xdg-open \"https://www.youtube.com/results?search_query=$encoded\""
else
    # Launch the selected app normally
    hyprctl dispatch exec "$selection"
fi

