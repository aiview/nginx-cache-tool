#!/bin/bash

if [[ $(whoami) != "root" ]]; then
    echo "please run this script under root. exiting"
    exit 1
fi

dir=$(dirname "$0") || exit $?

find "$dir" -type f -name 'nginx-cache-*' | xargs -I {} bash -c 'echo Copying {}; /bin/cp -a {} /usr/local/bin/ && chmod 755 /usr/local/bin/$(basename "{}")'
exit $(( PIPESTATUS + $? ))
