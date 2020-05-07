<?php


/* Champs table commentairtes :
commentaire_date 
commentaire_titre
commentaire_texte
ex 
commentaires_simples
*/

$commentaire_date=$_REQUEST['commentaire_date'];
$commentaire_titre=$_REQUEST['commentaire_titre'];
$commentaire_texte=$_REQUEST['commentaire_texte'];

// commentaires_simples
try {
			# première étape : je me connecte au serveur
		$pdo = new PDO("mysql:host=localhost;dbname=reseaux", "root");
          # seconde étape : je prépare, et j'exécute
        $sql = "INSERT INTO commentaire (commentaire_date, commentaire_titre, commentaire_texte) VALUES (?,?,?)";
        $stmt= $pdo->prepare($sql);
		$stmt->execute([$commentaire_date, $commentaire_titre, $commentaire_texte]);
        } catch (PDOException $exception){
            // s'il y a une erreur je l'affiche
            echo $exception->getMessage();
}     
/* On redirige vers la page index et on ajoute un paremetre "ajout_commentaire" pour afficher un message à l'utilisateur */
header('Location: index.php?ajout_commentaire=1');      
