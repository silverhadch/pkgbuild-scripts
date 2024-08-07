#!/bin/bash
# Will get the numbers of cpu cores for max power
num_jobs=$(nproc)
export MOLD_JOBS=1
export CARGO_TARGET_DIR=/tmp/
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
    echo "Tempfiles are being deleted ignore the permission denied, these are important and will not be touched."
    echo "The command will remove everything in tmp that is not protected, so dont worry"
    rm -rf /tmp/*
    cd ..
  else
    echo "Directory $dir does not exist."
  fi
done

