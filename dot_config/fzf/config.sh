#!/bin/bash

DRACULA_THEME=(
  --color="dark"
  --color="fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f"
  --color="info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7"
)

PREVIEW_WINDOW_SETTINGS=(
  --preview-window="noborder" 
  --prompt='" "' 
  --marker="+" 
  --pointer="◆"
  --separator="─" 
  --scrollbar="│" 
  --layout="reverse" 
  --info="right" 
)

KEYBINDS=(
  --bind ctrl-d:preview-down 
  --bind ctrl-u:preview-up
)

export FZF_DEFAULT_OPTS="${DRACULA_THEME[*]} ${PREVIEW_WINDOW_SETTINGS[*]} ${KEYBINDS[*]}"
