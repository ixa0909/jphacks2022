#!/bin/sh
read -p "Please input your comment:  " comment
git add -A 
git commit -a -m $comment
git push