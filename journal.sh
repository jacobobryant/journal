#!/bin/bash
#set -x

year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)
dir=$year/$month/$day
mkdir -p $dir

function commit {
    git commit -a -m hey
    git push
}

function edit {
    touch $dir/0.md
    nvim $(echo $dir/* | awk '{print $NF}')
}

function new {
    i=0
    while [ -f $dir/$i.md ]; do
        ((i++))
    done
    touch $dir/$i.md
    nvim $dir/$i.md
}

cmd=$1
if [ "$cmd" = "" ]; then
    cmd=edit
fi

$cmd
