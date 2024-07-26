#!/bin/bash

# Define the function with parameters
concatenate_strings() {
    local string1="$1"
    local string2="$2"
    echo "${string1}${string2}"
}

# Define two variables
a="Hello, "
b="world!"

# Call the function with variables as arguments
concatenate_strings "$a" "$b"