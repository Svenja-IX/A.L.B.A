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