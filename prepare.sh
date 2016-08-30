#!/bin/bash

# Check if `convert` exists. If not, exit.
command -v inkscape >/dev/null 2>&1 || {
  echo "The utility `inkscape` is required, but not found.  Aborting." >&2;
  exit 1;
}

# Create dist folder if not exists
DIST_FOLDER_NAME=dist
mkdir -p $DIST_FOLDER_NAME

# Rasterize all images in `developers`
mkdir -p "$DIST_FOLDER_NAME/developers"
for img in developers/*
do
  echo "Rasterizing $img"
  inkscape -z -e "$DIST_FOLDER_NAME/${img%.*}.png" -w 200 -h 200 $img
done

#Rasterize all images in `teams`
mkdir -p "$DIST_FOLDER_NAME/teams"
for img in teams/*
do
  echo "Rasterizing $img"
  inkscape -z -e "$DIST_FOLDER_NAME/${img%.*}.png" -w 200 -h 200 $img
done
