function showFile(fname, ftype){
    if(ftype == 'image/png' || ftype =='image/jpeg') {
        var file = $('<img src="/fileStore/' + fname +'" width="400px"/>')
    }
    else {
        var file = $('<p>' + fname + ', ' + ftype + '</p>')
    }
    var download = $('<div><a href="/download/' + fname + '">Download</a></div>')

    $('#display').empty()
    $('#display').append(file, download)
    $('#display').modal()
}