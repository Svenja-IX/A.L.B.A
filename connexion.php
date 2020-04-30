<?php 

if (!empty($_POST['compteuser_mail']) && !empty($_POST['compteuser_password'])) {

	if(filter_var($_POST['compteuser_mail'], FILTER_VALIDATE_EMAIL)) {

		try{
			$sql = new PDO("mysql:host=localhost;dbname=reseaux", "root");
			$requeteSQL = "SELECT * FROM `compteuser` WHERE compteuser_mail = :compteuser_mail";
			// je prepare ma requête
			$connexion = $sql->prepare($requeteSQL);
			
			// je lui donne les paramètres dont elle a besoin sans en oublier
			$connexion->bindValue(":compteuser_mail", $_POST['compteuser_mail']);

			// Je l'execute et en fonction de si l'email existe deja ou pas, j'insere ma requete dans la bdd
			$connexion->execute();
			
			// si la requete n'aboutit pas (car le mail n'a pas été rentré car il doit être unique,  
			// alors la requete ne s'effectue pas, si l'email n'est pas dans la bdd la requete se fais sans soucis
			if($connexion->rowCount() == 0){
				header("location: index.php?errorLogin=mailInexistant");
				exit;
			} else {

				$utilisateur = $connexion->fetch(PDO::FETCH_OBJ);
					// ensuite je test si les mdp correspondent entre eux
					if(password_verify($_POST['compteuser_password'], $utilisateur->compteuser_password)){
						//echo "vous êtes connectés";
						session_start();
						// lorsque l'utilisateur se connecte, rempli une variable de session qui sera accessible de partout
						$_SESSION['user'] = $utilisateur;

						// Je parcours toutes mes tables d'utilisateurs particuliers
						foreach ($tables as $table) {
							// Je veux savoir si une ligne de ma table correspond à l'utilisateur connecté
							$requeteSQL = "SELECT * FROM `$table` WHERE `".$table."_compteuser_id` = :compteuser_id";
							// Afin d'éviter les injections SQL je prépare ma requête
							$connexion = $db->prepare($requeteSQL);
							// j'intègre le mail à ma requête
							$connexion->bindValue(":compteuser_id", $utilisateur->compteuser_id);
							// j'exécute ma requete
							$connexion->execute();

							//var_dump($reqprepare->rowCount());
							// Si j'ai une ligne qui correspond 
							if($reqprepare->rowCount()==1){
								// Je renseigne la session avec le type d'utilisateur : $table
								$_SESSION['userType'] = $table;
								// Ainsi que les informations correspondantes à l'utilisateur
								$_SESSION[$table] = $connexion->fetch(PDO::FETCH_OBJ);
								// je sors de la boucle car ça ne sert à rien de continuer la boucle : j'ai déjà les informations dont j'ai besoin.
								break;
							}
						}	
					// Je redirige vers la page d'accueil. Cette page devient totalement invisible pour celui qui navigue sur le site
					header("Location: index.php?login=success");
					exit;	
				} else {
					header("Location: index.php?errorLogin=mauvaisMdp");
					exit;
				}			
			}
		}catch(PDOException $exception){
			echo $exception->getMessage();
		}
	} else {
		header("Location: index.php?errorLogin=mailInvalide");
		exit;
	}
} else {
	header("Location: index.php?errorLogin=vide");
	exit;
}