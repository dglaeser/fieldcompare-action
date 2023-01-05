#!/bin/bash -l

function exists() {
    if [[ -e $1 ]]; then return 0; else return 1; fi
}

function is_directory() {
    if [[ -d $1 ]]; then return 0; else return 1; fi
}

function is_file() {
    if [[ -f $1 ]]; then return 0; else return 1; fi
}

RESULT=$1
REFERENCE=$2
CLI_OPTS=$3

if ! exists $RESULT; then
    echo "Error: Result '${RESULT}' not found!"
    exit 1
fi

if ! exists $REFERENCE; then
    echo "Error: Reference '${REFERENCE}' not found!"
    exit 1
fi

COMP_MODE=""
if is_directory $RESULT && is_directory $REFERENCE; then
    COMP_MODE="dir"
elif is_file $RESULT && is_file $REFERENCE; then
    COMP_MODE="file"
else
    echo "Result and reference have to both be either files or folders."
    echo "Cannot compare a file against a folder."
    exit 1
fi

fieldcompare $COMP_MODE $RESULT $REFERENCE $CLI_OPTS
