#!/bin/bash

cat book.txt | tr -c '[:alpha:]' ' ' | sed 's/ \+/ /g' | tr '[:upper:]' '[:lower:]' > output.txt 
