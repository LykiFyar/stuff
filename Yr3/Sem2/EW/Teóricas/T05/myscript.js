$(function() {
    $("#hide").click(function() {
        $("p").hide()
    })
    
    $("#show").click(function() {
        $("p").show()
    })

    $("#p1").click(function() {
        $(this).css("color", "red")
    })

    $("#p2").on({
        mouseenter: function() { $(this).css("background-color", "blue")},
        mouseleave: function() {$(this).css("background-color", "green")},
        click: function() {$(this).css("background-color", "yellow")}
    })

    $("a").click(function(event) {
        event.preventDefault()
        alert("Este link não funciona, mostra esta janela...")
    })

})