#!/bin/bash

function modoUsar() {

	echo "Modo de Usar: `basename $0` <-s> Hostname ou IP do servidor"
	echo "Modo de Usar: `basename $0` <-f> Arquivo com a lista de servidores"
	exit 0 
}

function modoServer () {
	
	Nhost=$1

	read -p "Digite seu login: " Nuser
	read -s -p "Digite sua senha: " Npasswd
	./conectar.expect $Nhost $Nuser $Npasswd 
exit 0
}

function modoFile () {

	read -p "Digite seu login: " Nuser
	read -s -p "Digite sua senha: " Npasswd
	echo ""
	echo "###############################################################################"
	while read Nhost 
	do
		./conectar.expect $Nhost $Nuser $Npasswd | grep -i "Default principal: $Nuser" &&  echo "Equipamento $Nhost - OK" || echo "Equipamento $Nhost - NOT OK"   
        echo "###############################################################################"    
	done < $1

exit 0
}

while getopts "hsf:" OPCAO
do
    case $OPCAO in
        s) modoServer "$2" 
        ;;
        f) modoFile "$2" 
        ;;
        ?) modoUsar 
        ;;
        h) modoUsar     
	;;
	*) modoUsar
    esac
done

