<?php
$id=""; $nom=""; $delai_sauvegarde="";$duree_conservation=""; $email="";
if(isset($_POST) && !empty($_POST)){
    $id=$_POST['id'];
    $nom=$_POST['nom'];
    $delai_sauvegarde=$_POST['delai_sauvegarde'];
    $duree_conservation=$_POST['duree_conservation'];
    $email=$_POST['email'];
}
?>
<section class="row wrap x-center hauteur-main">
    <div class="">
        <div class="blanco div_moy center column padd-around">
            <p class="titre_RS center column">Information Client</p>
            <form  id="contact-form" method="post" <?php if(!empty($id)){echo "action=modify.php";}else{echo "action=create.php";} ?> >
                <table>
                    <tr>
                        <td align="right">
                            Nom :
                        </td>
                        <td>
                            <input type="text" name="nom" <?php if(!empty($nom)){echo "value=".$nom;} ?> />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Délai de sauvegarde :
                        </td>
                        <td>
                            <input type="text" name="delai_sauvegarde" <?php if(!empty($delai_sauvegarde)){echo "value=".$delai_sauvegarde;} ?> />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Durée de conservation :
                        </td>
                        <td>
                            <input type="text" name="duree_conservation" <?php if(!empty($duree_conservation)){echo "value=".$duree_conservation;} ?> />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Email :
                        </td>
                        <td>
                            <input type="text" name="email" <?php if(!empty($email)){echo "value=".$email;} ?> />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <?php if(!empty($id)){echo "<input type=hidden name=id value=".$id." />";} ?>
                            <button type="submit" class="btns">Envoyer</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</section>


