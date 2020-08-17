#!/bin/bash
# Delete highlight-article lines in old file
sed "/highlight-article.*/d" config > temp

# Remove blank lines from authors

# Append the new lines
sed "/^$/d" authors.txt | awk '{print "highlight-article \"author =~ \\\""$1"\\\"\" black color214 bold"}' >> temp

cp temp config

# Append the flags highlight
echo "highlight-article \"flags =~ \\\"n\\\"\" white red bold" >> ~/.newsboat/config

