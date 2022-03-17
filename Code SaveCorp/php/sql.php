<?php
try{
    $db = new PDO('mysql:host=localhost;dbname=savecorp', 'savecorp', 'savecorp');
}catch(Exception $e){
    echo "Échec : " . $e->getMessage();
}


function addUser($nom, $delai_sauvegarde,$duree_conservation, $email){
    global $db;
    try{
        $insert=$db->prepare('INSERT INTO infos_user (nom, delai_sauvegarde,duree_conservation, email) VALUES(:nom, :delai_sauvegarde,:duree_conservation, :email)');
        $insert->execute(array('nom' => $nom,'delai_sauvegarde' => $delai_sauvegarde,'duree_conservation' => $duree_conservation,'email' => $email));
        return true;
    }catch(Exception $e){
        echo $sql . "</br>" . $e->getMessage();
    }
    return false;
}


?>