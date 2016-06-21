#!/bin/bash

BUILD_DIR="/home/andrew/blog_notebooks/"
POST_DIR="/home/andrew/gitrepos/dkmehrmann.github.io/_posts/"

# use nbconvert on the file
ipython nbconvert --to markdown $1 --config jekyll.py
echo "converted .ipynb to .md, now headed to $BUILD_DIR to make additional changes"

ipynb_fname="$1"
md_fname="${ipynb_fname/ipynb/md}"
# copies the file to a newly named file
dt=`date +%Y-%m-%d`
fname="$dt-$md_fname"
cp $BUILD_DIR$md_fname $BUILD_DIR$fname
echo "file name changed from $1 to $fname"

# adds the date to the file
dt2=`date +"%b %d, %Y"`
sed -i "3i date: $dt2" $BUILD_DIR$fname
echo "added date $dt2 to line 3"

# Gets the title of the post
echo "What's the title of this post going to be?"
read ttl
sed -i "4i title: \"$ttl\"" $BUILD_DIR$fname
echo "added title $ttl in line 4"

mv $BUILD_DIR$fname $POST_DIR$fname
echo "moved $fname from $BUILD_DIR to $POST_DIR"
echo "Process Completed Successfully"
