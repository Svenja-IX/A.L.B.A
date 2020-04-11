<?php 
// ce fichier va servir à regrouper tous ce qui est relié à la bdd

require_once("includes/config.php");
try{
		# première étape : je me connecte au serveur
        $pdo = new PDO("mysql:host=".$host.";dbname=".$dbname, $userBdd, $passBdd);
        //$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);	
    
        //$pdo->query("INSERT INTO `Jeux` (`Jeux_Id`, `Jeux_Titre`, `Jeux_Description`, `Jeux_Prix`, `Jeux_DateSortie`, `Jeux_PaysOrigine`, `Jeux_Connexion`, `Jeux_Mode`, `Genre_Id`) VALUES (NULL, 'Jeux test;', 'jfhcshflb', '54664', '2020-04-01', 'Wakanda', 'Ou pas', 'si je veux', '5');");
    
        # seconde étape : j'envoie mes requètes
        $pdostat = $pdo->query("SELECT * FROM info");
        $pdostat->setFetchMode(PDO::FETCH_ASSOC);
    
} catch (Exception $exception){
	$messageError = $exception->getMessage();
}
?>