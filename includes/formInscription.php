<input type='button' value='Inscription' id='inscription-btn' class='header-btn'>
<div id="modalInscription">
    <div id="form-bloc">
        <div id="form-body">
            <div class="">
                <h4>Inscription</h4>
            </div>
        <form action="inscription.php" method="POST">
        <div class="form-div">
                <label for="compteuser_pseudo">Pseudo</label>
                <input type="text" name="compteuser_pseudo" id="compteuser_pseudo" placeholder="Votre pseudo" required>
            </div>
            <div class="form-div">
                <label for="compteuser_pseudo_mail">Mail</label>
                <input type="mail" name="compteuser_mail" id="compteuser_mail" placeholder="Votre mail" required>
            </div>
            <div class="form-div">
                <label for="compteuser_password">Mot de passe</label>
                <input type="password" name="compteuser_password" id="compteuser_password" placeholder="Entrez un mot de passe" required>
            </div>
            <div class="form-div">
                <label for="compteuser_confirmpassword">Confirmer le mot de passe</label>
                <input type="password" name="compteuser_confirmpassword" id="compteuser_confirmpassword" placeholder="Entrez le même mot de passe" required>
            </div>
            <div class='btn'>
                <div class="form-btn">
                    <input type="button" name="fermerInscription" id="fermerInscription" value="Fermer">
                </div>
                <div class="form-btn">
                    <input type="submit">
                </div>
            </div>
        </form>
        </div>
    </div>
</div>