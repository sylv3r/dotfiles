#!/bin/bash

for r in $(find ~/.vim/bundle -maxdepth 1 -type d)
  do
    echo "==> updating $r ..."
    cd $r
    git pull --rebase
    cd ..
done
