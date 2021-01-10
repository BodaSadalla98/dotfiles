#!/bin/sh

# filename
filename=$1
# file extension
extension="${filename##*.}"

if [ "$extension" = "cpp"  ] && [ ! -f "./$filename" ]; then
	cp -n ~/.config/nvim/templates/cpp_template.cpp ./$filename;
else
	echo "File Already Exist, Or the file isn't a c++ file"
	exit
fi

nvim $filename
