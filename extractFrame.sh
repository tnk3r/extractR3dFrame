#!/bin/bash

# Currently Extracts the first frame from
# each _001.R3D file found in a directory,
# for VR Template Creation,
# change R3D format option to make dpx,tif.

if [ -f /MediaDatabase/.today.txt ] ; then
    today=$(cat /MediaDatabase/.today.txt)
else
    today=$(date +%Y%M%d)
fi

folder="$1"
out="$2"
project="/Volumes/TANK/JOBS/BP-KOREA/$today"
mkdir -p "$project"/frames

for R3D in $(find $folder -iname "*001.R3D"); do

   REDline --format 3 --start 0 --end 0 -i "$R3D" --outDir "$out"/frames/;

done
