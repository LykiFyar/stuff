// mypages.js
// 2023-03-03
// HTML templates generating functions

exports.genMainPage = function(list, date) {
    var pagHTML = `
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8"/>
            <title>About People...</title>
            <link rel="stylesheet" type="text/css" href="w3.css"/>
        </head>
        <body>
            <div class="w3-card-4">
                <header class="w3-container w3-purple">
                    <h1>Lista de Pessoas</h1>
                </header>
            
            <div class="w3-container">
                <table class="w3-table-all">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Idade</th>
                        <th>Sexo</th>
                        <th>Cidade</th>
                    </tr>
            
            
                
                `
    for (let i = 0; i < list.length; i++) {
        pagHTML += `
        <tr>
            <td>${list[i].id}</td>
            <td>
                <a href="/pessoas/${list[i].id}">${list[i].nome}</a>
            </td>
            <td>${list[i].idade}</td>
            <td>${list[i].sexo}</td>
            <td>${list[i].morada.cidade}</td>
        </tr>
        `
    }


    pagHTML += `
                        </table>
                    </div>
                    <footer class="w3-container w3-blue">
                        <h5>Generated in EngWeb2023 ${date}</h5>
                    </footer>
                </div>
            </body>
        </html>
        `
    
    return pagHTML
}

exports.genPersonPage = function(p,d) {
    var pagHTML = `
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8"/>
            <title>Person Page</title>
            <link rel="stylesheet" type="text/css" href="w3.css"/>
        </head>
        <body>
            <div class="w3-card-4">
                <header class="w3-container w3-purple">
                    <h1>${p.nome}</h1>
                </header>
                <div class "w3-container">

                    <p>Preencher os restantes campos</p>
                
                </div>
                <footer class="w3-container w3-blue">
                        <h5>Generated in EngWeb2023 ${d}</h5>
                </footer>
            </div>
        </body>
    </html>
        `
    
    return pagHTML
}