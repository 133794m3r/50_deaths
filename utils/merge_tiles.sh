#!/bin/bash
if [ $# -ge 1 ];then
  case "$1" in
  	-h)
  	  echo -e "Usage: $0 <diectory_to_dawnrpg_tiles>|-h\nThis script will combine all of the individual tilesheets into a single one so that you can utilize Tiled's animation mode and also more easily animation your character for animations."
  	  ;;
  	*)
  	read -r cwd <<< $(pwd);
  	echo "$cwd";
	cd $1
	read -r -a arr <<< $(find -iname *0.png | tr '\n' ' ' | sed 's/\.\///g' | sed 's/0\.png//g');
	echo ${arr[*]} | python3 "$cwd/make_merged_tiles.py"
	;;
  esac
else
  	echo -e "Usage: $0 <diectory_to_the_combined_tiles>|-h\nThis script will combine all of the individual tilesheets into a single one so that you can utilize Tiled's animation mode and also more easily animation your character for animations."
fi
