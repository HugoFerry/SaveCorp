#!/bin/bash

date_ajd=$(date +%s)

listeclient=$(ls /home/)

for client in $listeclient
do

    last_save=$(ls /home/$client | ls -Art | tail -n 1 | date -r /home/$client +%s)
    
    intervalle=$(($date_ajd - $last_save))


    delai_query=`mysql -u savecorp -psavecorp -e "USE savecorp; SELECT delai_sauvegarde FROM infos_user WHERE nom = '$client' " `
    delai_seconde=$(echo $delai_query | cut -d " " -f 2)
    seconde_heure=86400

    delai_heure=$(($delai_seconde * $seconde_heure))
    
    echo $intervalle
    echo $delai_heure

    if [ $intervalle -gt $delai_heure ]
    then
        echo "Attention ! le client $client n'a pas respecté les délais de sauvegardes" | mail -s "Sauvegarde non effectuées : $client" ian.logeais@gmail.com
        echo "la dernière sauvegarde de $client n'est pas obsolète"
    else
    echo "le fichier de $client reste dans l'intervalle"
    fi


done