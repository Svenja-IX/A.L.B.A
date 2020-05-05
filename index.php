<?php
	session_start();
	include ('includes/head.php');
?>
	<body>
		<?php include ('includes/header.php'); ?>
		<main>
			<?php
				include ('includes/aside.php');
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
		<!-- j'inclus le commentaire uen fois qu'il est entre -->
        <center><h2>Votre commentaire a été ajouté </h2></center>
    <?php } ?>

      <h3>Les commentaires</h3>
      <ul>
      <?php foreach($commentaires as $commentaire){   ?>
					 <li><?php echo $commentaire['commentaire_date'].' - '.$commentaire['commentaire_titre'].' - ' .$commentaire['commentaire_texte']  ;?></li>
				<?php } ?>
      </ul>

	  <!-- Audrey Ajout carousel -->
	  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
			<script src="scripts/owl.carousel.js"></script>
			<script src="scripts/script.js"></script>
		<!-- /Audrey Ajout carousel -->
	</body>
	
</html>