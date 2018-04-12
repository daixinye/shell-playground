#! /bin/bash

# evaluate the status of a file
# if file does not exist then exit 1
# if file exist then echo it's type (regular file, directory, readable, writable and executable)

FILE="./"
# FILE = './test-file.sh'

if test -e "$FILE"; then
    echo "$FILE exist"
    if test -f "$FILE"; then
        echo "$FILE is a regular file"
    fi
    if test -d "$FILE"; then
        echo "$FILE is a directory"
    fi
    if test -r "$FILE"; then
        echo "$FILE is readable"
    fi
    if test -w "$FILE"; then
        echo "$FILE is writable"
    fi
    if test -x "$FILE"; then
        echo "$FILE is executable"
    fi
else
    echo "$FILE does not exist"
    exit 1
fi

exit

