<?php
include_once("sql.php");
$nom=""; $delai_sauvegarde="";$duree_conservation=""; $email="";
if(isset($_POST) && !empty($_POST)){
    $nom=$_POST['nom'];
    $delai_sauvegarde=$_POST['delai_sauvegarde'];
    $duree_conservation=$_POST['duree_conservation'];
    $email=$_POST['email'];
    addUser($nom, $delai_sauvegarde,$duree_conservation, $email);
}
echo '<meta http-equiv="refresh" content="0;URL=index.php" />';
?>
