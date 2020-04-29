<input type='button' value='Connexion' id='connexion-btn' class='header-btn'>
<div id="modalConnexion">
    <div id="form-bloc">
        <div id="form-body">
            <div class="">
                <h4>Connexion</h4>
            </div>
        <form action="connexion.php" method="POST">
            <div class="form-div">
                <label for="compteuser_mail">Mail</label>
                <input type="mail" name="compteuser_mail" id="compteuser_mail" placeholder="Votre mail" required>
            </div>
            <div class="form-div">
                <label for="compteuser_password">Mot de passe</label>
                <input type="password" name="compteuser_password" id="compteuser_password" placeholder="Entrez un mot de passe" required>
            </div>
            <div class='btn'>
                <div class="form-btn">
                    <input type="button" name="fermerConnexion" id="fermerConnexion" value="Fermer" required>
                </div>
                <div class="form-btn">
                    <input type="submit">
                </div>
            </div>
        </form>
        </div>
    </div>
</div>