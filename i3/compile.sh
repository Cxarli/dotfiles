#!/bin/sh

cd "$(dirname "$0")"


printf "" > config

for f in $(echo *.conf | sort); do

    printf "###\n###--- %s\n###\n\n" $f >> config

    cat $f >> config

    printf "\n\n" >> config
done

i3 -c config -C -V
