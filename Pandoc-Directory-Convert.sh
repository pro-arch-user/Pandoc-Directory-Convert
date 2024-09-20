# args:
# initial_path - directory to be converted
# from - extension of files that you want to convert from
# fromPandoc - extension of files that you want to convert from in pandoc
# toPandoc - extension of files that you want to convert to in pandoc
# delete - (optional) to delete the files used that you converted from. Make sure to backup your files before you do this.
parse_dir () {
	initial_path=$1
	from=$2
 	fromPandoc=$3
	toPandoc=$4
	delete=$5

	echo Converting directory $initial_path
	for file_path in "$initial_path"/*; do
		if [ -d "$file_path" ]; then
			parse_dir "$file_path" $from $fromPandoc $toPandoc $delete
		elif [[ $file_path == *.$from ]]; then
			file_name=$(basename "$file_path")
			file_path_no_file_extension=${file_path%.*}

			pandoc "$file_path" -f $fromPandoc -t $toPandoc -o "$file_path_no_file_extension.md"

			if [[ $delete == "delete" ]]; then
				rm -f "$file_path"
			fi
		fi
	done
	echo Finished converting directory $initial_path
}

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
  echo "Minimum 3 parameters are required: "directory", "from", "fromPandoc" and "toPandoc""
  exit 1
fi

echo Convertion started
echo
parse_dir "$1" $2 $3 $4 $5
echo
echo Convertion finished
