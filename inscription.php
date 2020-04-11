<?php 

if (!empty($_POST['info_prenom']) && !empty($_POST['info_password']) && !empty($_POST['info_email']) && !empty($_POST['info_password'])) {

	try{
		# première étape : je me connecte au serveur
		$sqlInsc = new PDO("mysql:host=localhost;dbname=entrainementphpbdd", "root");

		// je premare ma requête
		$stmt = $sqlInsc->prepare("INSERT INTO `info` (`info_id`, `info_prenom`, `info_nom`, `info_mail`, `info_password`) VALUES (NULL, :info_prenom, :info_nom, :info_email, :info_password);");
		
	// je lui donne les paramètres dont elle a besoin sans en oublier
		$stmt->bindValue(":info_prenom", $_POST['info_prenom']);
		$stmt->bindValue(":info_nom", $_POST['info_nom']);
		$stmt->bindValue(":info_email", $_POST['info_email']);
		$stmt->bindValue(":info_password", password_hash($_POST['info_password'], PASSWORD_DEFAULT));

		// Je l'execute et en fonction de si l'email existe deja ou pas, j'insere ma requete dans la bdd
		$stmt->execute();
		
		// si la requete n'aboutit pas (car le mail n'a pas été rentré car il doit être unique,  
		// alors la requete ne s'effectue pas, si l'email n'est pas dans la bdd la requete se fais sans soucis
		if($stmt->rowCount()==1){
			echo "insertion réussie !";
		} else {
			echo "insertion foirée !";
		}


		} catch (PDOException $exception){
			echo $exception->getMessage();
	}
}