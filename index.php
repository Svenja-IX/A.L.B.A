<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>A.L.B.A</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" href="styles/style.css">
		<!-- Audrey Ajout carousel -->
		<link rel="stylesheet" href="styles/owl.carousel.css">
		<link rel="stylesheet" href="styles/owl.theme.css">
		<!-- /Audrey Ajout carousel -->
	</head>
	<body>
		<main>
			<?php
				include ('inscription.php');
				include ('includes/aside.php');
				include ('includes/header.php');
				include ('includes/formConnexion.php');
       		 include ('includes/forminscription.php');
        $afficheArticle=false;
        
				try {
					# première étape : je me connecte au serveur
					$pdo = new PDO("mysql:host=localhost;dbname=reseaux", "root");
          if ($afficheArticle){
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
        } // fin si afficheArticle
					} catch (PDOException $exception){
					// s'il y a une erreur je l'affiche
					echo $exception->getMessage();
        }
     
				//Audrey Ajout carousel -->
				$pubs = $pdo->query("SELECT * FROM publicite");
        $pubs->setFetchMode(PDO::FETCH_ASSOC);
        
        // Audrey Ajout commentaire d
		$commentaires = $pdo->query("SELECT * FROM commentaire");
		// $commentaires = $pdo->query("SELECT * FROM commentaires_simples");
        // attention tabal commentaire de test car pb clef etrangere
        $commentaires->setFetchMode(PDO::FETCH_ASSOC);
				
			?>
		</main>
		<!-- voir si pour traitement des donnees -->
		<section id="les-promos">
			<div id="carousel-pubs" class="owl-carousel owl-theme">
				<?php foreach($pubs as $pub){   ?>
					<div class="item"> <a href="<?php echo $pub['publicite_lien']; ?>"> <img src="<?php echo $pub['publicite_image'];  ?>" alt="<?php echo $pub['publicite_description'] ;?>"></a></div>
				<?php } ?>
			</div>
		</section>
    
    <?php if ( isset($_REQUEST['ajout_commentaire']) ) { ?>
        <center><h2>Votre commentaire a été ajouté </h2></center>
    <?php } ?>

			<div class ="commentaire">
                <form method="post" action="ajout_commentaires.php">
					<fieldset>
						<legend><h2>COMMENTAIRE</h2></legend>
						<p><label>Dâte</label> <input type="date" id="commentaire_date" name="date" value="2020-04-2020" /></p>
						<p><label>Titre</label> <input type="text" id="commentaire_texte" name="titre" ></p>
						<p><label for="message">
						Votre Message</label><textarea name="message" id="commentaire_texte" class="message"placeholder="Type Your message" ></textarea></p>
						<input type="submit" id="cancel" value="Annuler" /><br> <input type="submit" id="submit" value="Envoyer" style= border: 1% solid black;/>
					</div>
				</fieldset>
      </form> 
      
      <h3>Les commentaires</h3>
      <ul>
      <?php foreach($commentaires as $commentaire){   ?>
					 <li><?php echo $commentaire['commentaire_date'].' - '.$commentaire['commentaire_titre'].' - ' .$commentaire['commentaire_texte']  ;?></li>
				<?php } ?>
      </ul>

      <!-- Audrey Ajout carousel -->
			<script
			src="https://code.jquery.com/jquery-2.2.4.js"
			integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
      crossorigin="anonymous"></script>
      <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
      <!-- /Audrey Ajout carousel -->

			<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
			<!-- Audrey Ajout carousel -->
			<script src="scripts/owl.carousel.js"></script>
			<script src="scripts/script.js"></script>
		<!-- /Audrey Ajout carousel -->
	</body>
</html>