#!/bin/bash
# Creará las usuarios para poder usar kubernete
ansible-playbook -i host usuarios.yml
# Principales preparaciones del sistema
ansible-playbook -i host prep.yml
# Habilitamos firewall
ansible-playbook -i host firewall.yml
# Creamos el server NFS
ansible-playbook -i host servernfs.yml
# Preparaciones para los workers
ansible-playbook -i host workersprep.yml
# Preparaciones para el master
ansible-playbook -i host masterprep.yml
# Preparaciones para el SDN en los workers y master
ansible-playbook -i host SDNazure.yml
# Preparaciones especificas para el master
ansible-playbook -i host SDNazuremaster.yml
# Añadimos el ingress controller
ansible-playbook -i host IngressController.yml
# Unimos los workers al nodo master
ansible-playbook -i host workersconfig.yml
# Creamos y mostramos una web con nginx
ansible-playbook -i host nginx.yml
# Probamos que el servidor NFS funcione
ansible-playbook -i host nfs.yml