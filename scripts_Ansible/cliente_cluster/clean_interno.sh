#!/bin/bash

#---NUNCA TROCAR OS NODES DESSE SCRIPT POR DOMAIN
ansible -i /home/telco.flavio/gamma/hosts -m shell -a "rm -rf /opt/jboss/domain/data" nodes_interno
ansible -i /home/telco.flavio/gamma/hosts -m shell -a "rm -rf /opt/jboss/domain/servers" nodes_interno
ansible -i /home/telco.flavio/gamma/hosts -m shell -a "rm -rf /opt/jboss/domain/tmp" nodes_interno 
echo "nodes internos limpos"
