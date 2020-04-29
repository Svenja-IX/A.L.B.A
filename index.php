<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>A.L.B.A</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style.css">
</head>
<body>
<main>

<?php
include ('inscription.php');
include ('includes/aside.php');
include ('includes/header.php');

try {
	# première étape : je me connecte au serveur
	$pdo = new PDO("mysql:host=localhost;dbname=reseaux", "root");

	# seconde étape : j'envoie mes requètes
	$pdostat = $pdo->query("SELECT * FROM compteuser");
	$pdostat->setFetchMode(PDO::FETCH_ASSOC);

    // j'ouvre une balise article qui contiendra toutes les card 
    echo '<article>';

    # troisième étape : je parcour ce que me renvoie le serveur
    // j'affiche le contenu de info ligne par ligne (note: j'aurais pu mettre ce que je veux a la place de $ligne)
    foreach($pdostat as $ligne){
    
        // j'afficher chaque ligne dans une card
        echo '<div class="card">
                    <img class="card-img-top" src="images/dsfsf.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">'.$ligne['compteuser_pseudo'].'</h5>
                    <p class="card-text">'.$ligne['compteuser_mail'].'</p>
                    <a href="#" class="btn btn-primary">Infos</a></div></div>';
    
    
    }

    // je referme la balise article
    echo '</article>';
	
} catch (PDOException $exception){
	// s'il y a une erreur je l'affiche
	echo $exception->getMessage();
}


?>
</main>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="scripts/script.js"></script>

</body>
</html>


