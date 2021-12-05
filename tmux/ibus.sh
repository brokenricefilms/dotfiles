#! /usr/bin/env sh

if [[ `ibus engine | awk -F":" '{ print $2 }'` == "us" ]]; then
    echo '🇺🇲'
else
    echo '🇻🇳'
fi
