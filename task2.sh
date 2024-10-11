#!/bin/bash

# Single pipeline command to accomplish all tasks without loops
grep -l "sample" file* | \
xargs -I{} sh -c 'count=$(grep -o "CSC510" "{}" | wc -l); if [ "$count" -ge 3 ]; then size=$(stat --printf="%s" "{}"); echo "$count $size filtered_$(basename "{}")"; fi' | \
sort -k1,1nr -k2,2nr
