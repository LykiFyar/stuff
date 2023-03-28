$(function() {
    var paraCount = 0

    $.get('http://localhost:3000/paras', function(data) {
        paraCount = data.length
        data.forEach(p => {
            var contents = "<li><b>" + p.date + "</b>: " + p.p + "</li>"
            $("#paraList").append(contents)
        });
    }).fail(function(error) {
        alert("Error: " + JSON.stringify(error))
    })


    $("#addPara").click(function() {
        var d = new Date()
        var timestamp = d.toISOString().substring(0,16);
        var contents = "<li><b>" + timestamp + "</b>: " + $("#paraText").val() + "</li>"
        $("#paraList").append(contents)

        paraCount ++
        var newPara = {
            id: "p" + paraCount,
            date: timestamp,
            p: $("#paraText").val()
        }

        $.post('http://localhost:3000/paras', newPara, function(response) {
            alert("Record inserted: " + JSON.stringify(response))
        }).fail(function(error) {
            alert("Error: " + JSON.stringify(error))
        })
    })
})