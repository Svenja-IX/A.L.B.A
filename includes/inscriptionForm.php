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
                  <input type="text" name="info_prenom" id="info_prenom" class="form-control" placeholder="Prénom" required>
                </div>
                <div class="form-group">
                  <input type="text" name="info_nom" id="info_nom" class="form-control" placeholder="Nom" required>
                </div>
                <div class="form-group">
                  <input type="email" name="info_email" id="info_email" class="form-control" placeholder="Email" required>
                </div>
                <div class="form-group">
                  <input type="password" name="info_password" id="info_password" class="form-control" placeholder="Mot de passe" required>
                </div>
                <button type="submit" class="btn btn-primary">Valider l'inscription</button>
              </form>
        </div>
      </div>
    </div>
  </div>
