#!/bin/bash

#  Part a   
# Extract passengers from 2nd class who embarked at Southampton.
# grep -E "^[0-9]{1,3},[0-9],2,.,.,.,.,.,.,.,.,S" titanic.csv

#  Part b   
# Then replace male/female labels with respectively M/F.
# sed 's/female/F/; s/male/M/' titanic.csv

#  Part c   #

# Finally, calculate the average age of the filtered passengers.
# gawk -F, '{ ageSum += $7; counter += 1 } END { print ageSum / counter }'

# All the parts piped together
grep -E "^[0-9]{1,3},[0-9],2,.*,.*,.*,.*,.*,.*,.*,.*,S" titanic.csv | sed 's/female/F/; s/male/M/' | gawk -F, '$7 ~ /^[0-9]+(\.[0-9]+)?$/ { print; ageSum += $7; counter += 1 } END { if (counter > 0) print "\nAverage Age: " ageSum / counter; else print "No valid data found" }'
exit