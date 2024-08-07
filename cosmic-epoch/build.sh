#!/bin/bash
# Will get the numbers of cpu cores for max power
num_jobs=$(nproc)

# List
directories=(
  "cosmic-applets-git"
  "cosmic-applibrary-git"
  "cosmic-bg-git"
  "cosmic-comp-git"
  "cosmic-launcher-git"
  "cosmic-osd-git"
  "cosmic-panel-git"
  "cosmic-workspaces-epoch-git"
  "cosmic-session-git"
  "cosmic-settings-daemon-git"
  "xdg-desktop-portal-cosmic-git"
)

# Iterate over each directory and run paru
for dir in "${directories[@]}"; do
  if [ -d "$dir" ]; then
    cd "$dir"
    paru --mflags="-j${num_jobs}" -Ui
    cd ..
  else
    echo "Directory $dir does not exist."
  fi
done

