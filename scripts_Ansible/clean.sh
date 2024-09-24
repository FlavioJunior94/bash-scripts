#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Passe um ambiente válido como parâmetro: $0 <nodes>"
    exit 1
fi

nodes="$1"


if [[ "$nodes" == "domain_interno" || "$nodes" == "domain_tecnico" || "$nodes" == "domain_digital" || "$nodes" == "domain_externo" ]]; then
    echo "Você não pode limpar este node, ele é um domain."
else
    ansible -i /home/telco.flavio/solucao/hosts -m command -a "rm -fr /home/telco.flavio/teste_apagar" -B 600 --poll 0 "$nodes"
    ansible -i /home/telco.flavio/solucao/hosts -m command -a "rm -fr /home/telco.flavio/teste_apagar2" -B 300 --poll 0 "$nodes"
fi