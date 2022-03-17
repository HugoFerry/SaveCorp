#!/bin/bash

querymax=`mysql -u savecorp -psavecorp -e "USE savecorp; SELECT MAX(id) FROM infos_user"`
sql_max=$(echo $querymax | cut -d " " -f 2)

alter =`mysql -u savecorp -psavecorp -e "USE savecorp; ALTER TABLE infos_user AUTO_INCREMENT = $sqlmax"`
