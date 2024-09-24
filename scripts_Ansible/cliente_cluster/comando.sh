#!/bin/bash


if [ "$#" -ne 2 ]; then
    echo "deve ser passado os parametros: $0 <comando> <nodes>"
    exit 1
fi

comando="$1"
nodes="$2"

ansible -i /home/flavio/gamma/hosts -m shell -a "$comando" "$nodes"