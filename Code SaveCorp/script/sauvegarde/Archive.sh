#!/bin/bash

#nbUser=`cat /etc/passwd | grep /home | grep 100 | wc -l`

listeclient=$(ls /home)

for client in $listeclient
do


    tempsarchive=`mysql -u savecorp -psavecorp -e "USE savecorp; SELECT duree_conservation FROM infos_user WHERE nom = '$client' " `

    temps=$(echo $tempsarchive | cut -d " " -f 2)
    echo $client
    echo $temps

    find /home/$client/saves -mtime +$temps -exec rm -rf {} \;

    #find /path/to/files* -mtime +5 -exec rm {} \;

done






