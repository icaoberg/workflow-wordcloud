#!/bin/bash

# Assuming your data is in a file named data.txt
data_file=$1
output_file="histogram.png"  # Set the desired output file name and format

# Create a histogram using gnuplot and save it to disk
awk '{for(i=1;i<=NF;i++) print $i}' "$data_file" | sort | uniq -c | \
gnuplot -e "set term png; set output '$output_file'; \
            set title 'Histogram of Data'; set ylabel 'Frequency'; set xlabel 'Values'; \
            binwidth=0.1; \
            bin(x,width)=width*floor(x/width); \
            plot '$data_file' using (bin(\$1,binwidth)):(1.0) smooth freq with boxes title 'Histogram'"

echo "Histogram saved to $output_file"

