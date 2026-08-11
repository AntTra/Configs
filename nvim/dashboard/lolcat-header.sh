#!/usr/bin/env bash
# Animates a .cat ASCII art file by cycling lolcat's color offset.
# Usage: lolcat-header.sh /path/to/header.cat

counter=0

# Save cursor position once (matches lolcat's own --animate implementation),
# then restore-and-redraw each frame instead of homing to an absolute
# row/col — homing assumes the pty's origin is exactly (0,0), which doesn't
# hold inside Neovim's embedded terminal window and caused the art to drift.
printf '\033[?25l\0337'
trap 'printf "\033[?25h"' EXIT

while :; do
  counter=$((counter + 2))
  printf '\0338'
  lolcat "$1" -S "$counter" -f
  sleep 0.08
done
