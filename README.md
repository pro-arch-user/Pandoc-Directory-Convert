# Pandoc-Directory-Convert
[Pandoc](https://pandoc.org/) doesn't make it easy to work with directories (why? idk). So I created a shell script that recursively scans all subdirectories in a given directory and converts all the files in them one by one.

# Download
1) Install [Pandoc](https://pandoc.org/)
2) Download and run "Pandoc-Directory-Convert.sh"

# Usage
`$ sh Pandoc-Directory-Convert.sh directory from to`

`$ sh Pandoc-Directory-Convert.sh directory from to delete`
### Example usage:
`$ sh Pandoc-Directory-Convert.sh test docx markdown true delete`

`$ sh Pandoc-Directory-Convert.sh "C:\Users\user\Downloads\Test" docx markdown`

### Required script parameters:
1) initial_path - directory to be converted
2) from - extension of files that you want to convert from DOESN'T WORK WITH PANDOC EXTENSIONS
3) to - extension of files that you want to convert to IN PANDOC
### Optional script parameters:
1) delete - to delete the files used that you converted from. Make sure to backup your files before you do this.
