<?php

if (!empty($_POST['compteuser_pseudo']) && !empty($_POST['compteuser_mail']) && !empty($_POST['compteuser_password']) && !empty($_POST['compteuser_confirmpassword'])) {
	
	if ($_POST['compteuser_password'] == $_POST['compteuser_confirmpassword']) {
	
		try{
			// connexion à la bdd
			$sql = new PDO("mysql:host=localhost;dbname=reseaux", "root");

			// preparation de la requête
			$stmt = $sql->prepare("INSERT INTO `compteuser` (`compteuser_pseudo`, `compteuser_mail`, `compteuser_password`) VALUES (:compteuser_pseudo, :compteuser_mail, :compteuser_password);");
			
			// je lui donne les paramètres dont elle a besoin sans en oublier
			$stmt->bindValue(":compteuser_pseudo", $_POST['compteuser_pseudo']);
			$stmt->bindValue(":compteuser_mail", $_POST['compteuser_mail']);
			$stmt->bindValue(":compteuser_password", password_hash($_POST['compteuser_password'], PASSWORD_DEFAULT));

			// j'éxécute
			$stmt->execute();
			
			// si la requete n'aboutit pas (car le mail n'a pas été rentré ou existe deja dans la bdd
			// il doit être unique, alors la requete ne s'effectue pas, sinon elle s'effectue
			if($stmt->rowCount()==1){
				header('Location: index.php?success');
			} else {
				header('Location: index.php?fail');
			}

			} catch (PDOException $exception){
				echo $exception->getMessage();
			}
		} else {
			header('Location: index.php?errormdp');
		}
}
?>
</main>
<script src="scripts/script.js"></script>

</body>
</html>