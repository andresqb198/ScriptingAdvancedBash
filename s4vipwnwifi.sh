#!/bin/bash

# Author:  D4Vinci

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
    echo "Saliendo"
}


function helpPanel(){
    echo "Estamos dentro del panel de ayuda"
    exit 0
}

function startAttack(){
    echo -e "${greenColour}[*] Iniciando ataque${endColour}"
}

# Main fucntion

if [ "$(id -u)" == "0" ]; then
    declare -i parameter_counter=0; while getopts ":a:n:h" arg; do
        case $arg in
           a) attack_mode=$OPTARG; let parameter_counter+=1 ;;
           n) networkCard=$OPTARG; let parameter_counter+=1 ;; 
           h) helpPanel ;;
        esac
    done

    if [ $parameter_counter -ne 2 ]; then
        echo -e "${redColour}[*] Faltan argumentos${endColour}\n"
        helpPanel
    else
        startAttack
    fi

else
    echo -e "${redColour}[*] No soy root${endColour}\n"
fi