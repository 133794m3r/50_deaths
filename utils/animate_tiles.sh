#!/bin/bash
if [ $# -ge 1 ];then
  case "$1" in
  	-h)
  	  echo -e "Usage: $0 <diectory_to_the_combined_tiles>|-h\nThis script will take all of the tiles from the previous step and generate tilesets for them."
  	  ;;
  	*)
  	read -r cwd <<< $(pwd);

	cd $1
	#read -r -a arr <<< $(find -regextype sed -regex '.*/*\(numbered\)\.png$' | sed 's/_numbered//g' | tr '\n' ' ');
	read -r -a arr <<< $(find -iname *0.png | tr '\n' ' ' | sed 's/\.\///g' | sed 's/0\.png//g');
	echo ${arr[*]} | python3 "$cwd/check_animations.py"
	;;
  esac
else
  	echo -e "Usage: $0 <diectory_to_the_combined_tiles>|-h\nThis script will combine all of the individual tilesheets into a single one so that you can utilize Tiled's animation mode and also more easily animation your character for animations."
fi