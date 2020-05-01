<input type='button' value='Commentaire' id='commentaire-btn' class='header-btn'>
<div id="modalCommentaire">
    <div id="form-bloc">
        <div id="form-body">
            <div class="">
                <h4>Commentaire</h4>
            </div>
        <form action="ajout_commentaires.php" method="POST">
        <div class="form-div">
                <label for="commentaire_date">Dâte</label>
                <input type="date" name="commentaire_date" id="commentaire_date" value="2020-04-2020">
            </div>
            <div class="form-div">
                <label for="commentaire_texte">Titre</label>
                <input type="text" name="commentaire_titre" id="commentaire_titre" placeholder="Tapez votre Titre" required>
            </div>
            <div class="form-div">
                <label for="commentaire_texte">Votre Message</label>
                <input type="message" name="commentaire_texte" id="commentaire_texte" placeholder="Entrez votre message" required>
            </div>

            <div class='btn'>
                <div class="form-btn">
                    <input type="button" name="fermerCommentaire" id="fermerCommentaire" value="Fermer" required>
                </div>
                <div class="form-btn">
                    <input type="submit">
                </div>
            </div>
        </form>
        </div>
    </div>
</div>


