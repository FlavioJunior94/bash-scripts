#!/bin/bash


if [ "$#" -ne 1 ]; then
    echo "passe um ambiente valido como parametro: $0  <nodes>"
    exit 1
fi

nodes="$1"

ansible -i /home/flavio/gamma/hosts -m command -a "sudo systemctl stop jboss" -B 600 --poll 0 "$nodes"
ansible -i /home/flavio/gamma/hosts -m command -a "sudo service jboss stop" -B 600 --poll 0 "$nodes"