import json

# TODO 
# Adicionar ligações (lista) em cada cidade


def ordCidade(c):
    return c["nome"]

f = open("mapa.json")
mapa = json.load(f)
cidades = mapa["cidades"]

cidades.sort(key=ordCidade)

pagHTML = """<!DOCTYPE html>
<html>
    <head>
        <title>Mapa Virtual</title>
        <meta charset="utf-8"/>
    </head>
    <body>
        <center>
            <h1>Mapa Virtual</h1>
        </center>
        <table>
            <tr>
                <!-- Índice -->
                <td valign="top">
                    <a name="indice"/>
                    <h3>Índice</h3>
                    <ul>"""

for c in cidades:
    
    pagHTML += f"""
    <li>
        <a href="#{c['id']}">{c["nome"]}</a>
    </li>
    """
    
for c in cidades:
    pagHTML += f"""
    <a name="{c["id"]}"/>
    <h3>{c["nome"]}</h3>

    <p><b>População: </b>{c["população"]}</p>
    <p><b>Descrição: </b>{c["descrição"]}</p>
    <p><b>Distrito: </b>{c["distrito"]}</p>
    <address> </address>
    <center>
        <hr width="80%"/>
    </center>
    """

pagHTML += """<td>
                    <a name="c1"/>
                    <h3>Caminha</h3>

                    <p><b>População: </b>354</p>
                    <p><b>Descrição: </b>354</p>
                    <p><b>Distrito: </b>354</p>
                </td>
            </tr>
        </table>
    </body>
</html>"""
    
    
print(pagHTML)