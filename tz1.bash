#!/bin/bash



function find_deep_dirs {



	for new_dir in "$1"/*; do

		if [ -f "$new_dir" ]; then

			enter_dir_files+=' '

			enter_dir_files+=$new_dir

		fi

		if [ -d "$new_dir" ]; then

			enter_dir_dirs+=' '

			enter_dir_dirs+=$new_dir

			find_deep_dirs $new_dir

		fi

		

	done

}





enter_dir="/home/daser/tz1/enter_dir"

quit_dir="/home/daser/tz1/quit_dir"



enter_enter_dir_files=()   # список файлов, находящихся непосредственно во входной директории (не во вложенных в нее директориях)

enter_dir_files=() # список всех файлов, вложенных во входную директорию

enter_dir_dirs=()  # список директорий, находящихся во входной директории





for file in "$enter_dir"/*; do

	if [ -f "$file" ]; then

		enter_dir_files+=' '

		enter_dir_files+=$file

	fi

done



for file in "$enter_dir"/*; do

	if [ -d "$file" ]; then

		find_deep_dirs $file

		enter_dir_dirs+=' '

		enter_dir_dirs+=$file

	fi

done



for file in "$enter_dir"/*; do

	if [ -f "$file" ]; then

		enter_dir_files+=' '

		enter_dir_files+=$file

	fi

done



#echo $enter_dir_dirs

#echo $enter_dir_files

echo $enter_enter_dir_files



for file in ${enter_dir_files[*]}; do

	echo $file

	cp "$file" "$quit_dir"

done

