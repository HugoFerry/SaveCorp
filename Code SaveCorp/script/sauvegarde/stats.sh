#!/bin/bash

date=$(date -r $2 "+%d-%m-%Y-")
fichier=${date}listing.txt
function check
{
  ls "$1" | while read element
  do
    if [ -f "$1/$element" ]
    then
      if [ ! -f "$DefaultRep${1:nb}/$element" ]
      then
          echo "DELETED / $DefaultRep${1:nb}/$element" >> $fichier
      elif [ ! "$(md5sum "$1/$element" | cut -d " " -f 1)" = "$(md5sum "$DefaultRep${1:nb}/$element" | cut -d " " -f 1)" ]
      then
        echo "CHANGED / $DefaultRep${1:nb}/$element" >> $fichier
      else
        echo "UNCHANGED / $DefaultRep${1:nb}/$element" >> $fichier
      fi 
    elif [ -d "$1/$element" ]
    then
      check "$1/$element"
    fi
  done
 }

 function checkCreate
 {
   ls "$1" | while read element
   do
    if [ -f "$1/$element" ]
    then
      if [ ! -f "$2/$element" ]
      then
        echo "CREATED / $1/$element" >> $fichier
      fi 
    elif [ -d "$1/$element" ]
    then
      checkCreate "$1/$element" "$2/$element"
    fi
   done
 }


creationdate=$(date -r $1)

sizesave=$(du -bch $2 | tail -1 | cut -f1)
sizedelete=$(du -bch $1 | tail -1 | cut -f1)

fichiersuppr=$(cat $fichier  | grep 'DELETED' $fichier | wc -l)
fichiersauvegarde=$(cat $fichier | grep 'CREATED' $fichier | wc -l)
fichiermodif=$(cat $fichier | grep 'CHANGED' $fichier | wc -l)
fichierinchange=$(cat $fichier | grep 'UNCHANGED' $fichier | wc -l)

echo -e "Liste des fichiers parcourus : \n\nIl y a $fichiersuppr fichiers supprimés\nIl y a $fichiersauvegarde fichiers sauvegardé\nIl y a $fichiermodif fichiers modifiés\nIl y a $fichierinchange fichiers non modifiés\n" > $fichier
echo -e "La taille totale des fichiers sauvegardé est $sizesave" >> $fichier
echo -e "La taille totale des fichiers supprimé est $sizedelete\n" >> $fichier
echo -e "La date de création du dossier est $creationdate\n" >> $fichier

DefaultRep=$2
nb=${#1}

check $1
checkCreate $2 $1