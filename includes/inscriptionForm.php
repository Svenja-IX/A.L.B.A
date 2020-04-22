  <!-- Modal inscription -->
  <div class="modal fade" id="signIn" tabindex="-1" role="dialog" aria-labelledby="signInTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="signInTitle">Inscription</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <form action="inscription.php" method="POST">
                <div class="form-group">
                  <input type="text" name="compteuser_pseudo" id="compteuser_pseudo" class="form-control" placeholder="Pseudo" required>
                </div>
                <div class="form-group">
                  <input type="email" name="compteuser_mail" id="compteuser_mail" class="form-control" placeholder="Email" required>
                </div>
                <div class="form-group">
                  <input type="password" name="compteuser_password" id="compteuser_password" class="form-control" placeholder="Mot de passe" required>
                </div>
                <button type="submit" class="btn btn-primary">Valider l'inscription</button>
              </form>
        </div>
      </div>
    </div>
  </div>
