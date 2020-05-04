<header>
        <div>
            <div id="titre-header">
                <h1>ALBA</h1>
            </div>
            <?php 
                if (empty($_SESSION)) {
                    include ('includes/formInscription.php'); 
                    include ('includes/formConnexion.php');    
                    // include ('includes/formCommentaire.php');     
                }
                else {
                    include ('includes/Deconnexion.php');      
                    include ('includes/formCommentaire.php');    
                }
            ?>
            </div>
        </div>
    </header>