<?php 

if (!empty($_POST['compteuser_pseudo']) && !empty($_POST['compteuser_password']) && !empty($_POST['compteuser_mail'])) {

	try{
		# première étape : je me connecte au serveur
		$sqlInsc = new PDO("mysql:host=localhost;dbname=reseaux", "root");

		// je premare ma requête
		$stmt = $sqlInsc->prepare("INSERT INTO `compteuser` (`compteuser_id`, `compteuser_pseudo`, `compteuser_password`, `compteuser_mail`) VALUES (NULL, ':compteuser_mail', ':compteuser_pseudo', ':compteuser_password')");
		
	// je lui donne les paramètres dont elle a besoin sans en oublier
		$stmt->bindValue(":compteuser_pseudo", $_POST['compteuser_pseudo']);
		$stmt->bindValue(":compteuser_password", password_hash($_POST['compteuser_password'], PASSWORD_DEFAULT));
		$stmt->bindValue(":compteuser_mail", $_POST['info_mail']);

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