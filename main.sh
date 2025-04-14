#!/bin/bash

if [ "$1" != "-a" ] && [ "$1" != "-t" ]; then
    echo "To use the program $0 you must give the following flags:"
    echo "-a for agile"
    echo "-t for traditional"
    exit 1
fi