// var cardFossile = '<div class="card-deck"><div class="card"><img class="card-img-top" src="../img/fossile.jpg" alt="Card image cap"><div class="card-body"><h5 class="card-title">Card title</h5><p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p><a href="#" class="btn btn-primary">Go somewhere</a></div></div><div class="card"><img class="card-img-top" src="../img/fossile.jpg"" alt="Card image cap"><div class="card-body"><h5 class="card-title">Card title</h5><p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p><a href="#" class="btn btn-primary">Go somewhere</a></div></div><div class="card"><img class="card-img-top" src="../img/fossile.jpg"" alt="Card image cap"><div class="card-body"><h5 class="card-title">Card title</h5><p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p><a href="#" class="btn btn-primary">Go somewhere</a></div></div></div>'
// var i = 0;
// while (i < 25) {
// $('body').append(cardFossile);
// i++;
// }
// $('.card').eq(74).remove();
// $('.card').eq(73).remove();
// $('.card-deck').first().css("margin-top", "150px");
// $('.card-deck').css("padding", "2%");
// $('.card-deck').last().css({
//     'width' : '50%',
//     'margin' : 'auto'
// });
// // var cod = "<div>Why &lt;?php echo 'hello'; ?&gt; there!</div>";
// var phpF = "?>"
// var phpD = "<?php"
// var test = 'echo $ligne["info_prenom"];';
// // $('.card h5').eq(0).replaceWith(test);
// // $('img').eq(0).html('<img src="f3d0ea3adb7a02fadd995992a31498c4.jpg">');

// // var code = "Why <?php echo $ligne['info_prenom']; ?> there!";
// // document.getElementsByTagName('body').appendChild(document.createTextNode(code));

// if ( $('.card h5').eq(0).val() == "Card title" ) {
//     $('.card h5').eq(0).val(test);
// }


/******************************/
// fonction ouverute/fermeture modal
$("img").click(function(){
  $('#modal').css({
          "transition": "0.5s",
          "display": "unset"
          
  })
});
$("#fermerAddPerso").click(function(){
  $('#modal').css({
          "transition": "0.5s",
          "display": "none"
  })
});

//------------------------------------

$("#inscription-btn").click(function(){
  $('#modalInscription').css({
          "transition": "0.5s",
          "display": "unset"
          
  })
});
$("#fermerInscription").click(function(){
  $('#modalInscription').css({
          "transition": "0.5s",
          "display": "none"
  })
});

//------------------------------------

$("#connexion-btn").click(function(){
  $('#modalConnexion').css({
          "transition": "0.5s",
          "display": "unset"
          
  })
});
$("#fermerConnexion").click(function(){
  $('#modalConnexion').css({
          "transition": "0.5s",
          "display": "none"
  })
});



//------------------------------------

$("#commentaire-btn").click(function(){
  $('#modalCommentaire').css({
          "transition": "0.5s",
          "display": "unset"
          
  })
});
$("#fermerCommentaire").click(function(){
  $('#modalCommentaire').css({
          "transition": "0.5s",
          "display": "none"
  })
});






// script JS pour caroussel
// une fois que la page est charge 

$(document).ready(function() {
  // on affuche dans la console un texte pour vérifier le bon chargement
console.log('Start');     

// on appelle la methode owncarousel
      $("#carousel-pubs").owlCarousel({
		
          navigation : false, // Pas de bouton
          slideSpeed : 300, // Vitesse du slide
          paginationSpeed : 400,
          singleItem:true // Une image par une image
     
      });
     
      console.log('End');     
    });

