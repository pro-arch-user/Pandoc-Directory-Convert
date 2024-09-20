# use from cmd:
# $ sh Recursive_directory_pandoc_convert.sh directory from to (optional: delete)
# example use from cmd:
# $ sh Recursive_directory_pandoc_convert.sh ./Test docx markdown true (optional: delete)
# or
# $ sh Recursive_directory_pandoc_convert.sh "C:\Users\user\Downloads\Test" docx markdown (optional: delete)

# args:
# initial_path - directory to be converted
# from - extension of files that you want to convert from DOESN'T WORK WITH PANDOC EXTENSIONS
# to - extension of files that you want to convert to IN PANDOC
# delete - to delete the files used that you converted from. Make sure to backup your files before you do this.
parse_dir () {
	initial_path=$1
	from=$2
	to=$3
	delete=$4

	echo Converting directory $initial_path
	for file_path in "$initial_path"/*; do
		if [ -d "$file_path" ]; then
			parse_dir "$file_path" $from $to $delete
		elif [[ $file_path == *.$from ]]; then
			file_name=$(basename "$file_path")
			file_path_no_file_extension=${file_path%.*}

			pandoc "$file_path" -f $from -t $to -o "$file_path_no_file_extension.md"

			if [[ $delete == "delete" ]]; then
				rm -f "$file_path"
			fi
		fi
	done
	echo Finished converting directory $initial_path
}

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "Minimum 3 parameters are required: "directory", "from" and "to""
  exit 1
fi

echo Convertion started
echo
parse_dir "$1" $2 $3 $4
echo
echo Convertion finished