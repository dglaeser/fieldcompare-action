#!/bin/bash -l

function remove_spaces() {
    local INPUT=$1
    echo "${INPUT//[[:space:]]/}"
}

function is_url() {
    local INPUT=$1
    INPUT=$(remove_spaces $INPUT)
    if [[ "${INPUT:0:4}" == "http" ]]; then
        return 0;
    else
        return 1;
    fi
}

function url_file_name() {
    local INPUT=$1
    echo "${INPUT##*/}"
}

FILE=$1
REFERENCE=$2

FILENAME=$FILE
if is_url $FILE; then
    FILENAME=$(url_file_name $FILE)
    echo "Downloading data file"
    wget $FILE -O $FILENAME
fi

REFERENCE_FILE_NAME=$REFERENCE
if is_url $REFERENCE; then
    REFERENCE_FILE_NAME=$(url_file_name $REFERENCE)
    echo "Downloading reference file"
    wget $REFERENCE -O $REFERENCE_FILE_NAME
fi

fieldcompare file $FILENAME --reference $REFERENCE_FILE_NAME
