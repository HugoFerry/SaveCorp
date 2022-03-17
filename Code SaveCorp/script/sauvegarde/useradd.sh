#!/bin/bash

querymax=`mysql -u savecorp -psavecorp -e "USE savecorp; SELECT MAX(id) FROM infos_user"`
sql_max=$(echo $querymax | cut -d " " -f 2)


for ((i=1; i <= $sql_max; i++))
do 

    query=`mysql -u savecorp -psavecorp -e "USE savecorp; SELECT nom FROM infos_user WHERE id = "$i""`
    result=$(echo $query | cut -d " " -f 2)

    if [ ! -d "/home/$result/" ]
        then 
        echo "L'utilisateur ${result} a bien été créée, vous pouvez le retrouver dans /home/${result} !"
        useradd -m $result
        mkdir /home/$result/saves
        chmod 402 /home/$result
    else 
        echo "L'utilisateur ${result} est déjà existant, vous pouvez le retrouver dans /home/${result} !"
    fi
    echo $i
done