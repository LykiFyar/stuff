def leftcard(f):
    data = """<!DOCTYPE html>
    <html>
    <head></head>
    <body class="w3-light-grey">
    <title>{{ title }}</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://kit.fontawesome.com/83260f98e0.js" crossorigin="anonymous"></script>
    <div class="w3-content w3-margin-top" style="max-width:1400px;">
    <div class="w3-row-padding">
    <div class="w3-third">
    <div class="w3-white w3-text-grey w3-card-4">
    <div class="w3-display-container">
    <div class="w3-container w3-teal">
    <h2>{{ title }}</h2>
    </div>
    <div class="w3-bar-block w3-teal">
    <a href="informacao.html" class="w3-bar-item w3-button">Informação</a>
    <a href="programa.html" class="w3-bar-item w3-button">Programa</a>
    <a href="docentes.html" class="w3-bar-item w3-button">Docentes</a>
    <a href="bibliografia.html" class="w3-bar-item w3-button">Bibliografia</a>
    <a href="informacao_comp.html" class="w3-bar-item w3-button">Informação Complementar</a>
    <a href="metodologia.html" class="w3-bar-item w3-button">Metodologia de Avaliação</a>
    </div>
    <div class="w3-margin-left" style="max-width:1400px;">
    <h4><b class="w3-text-grey"><i class="fas fa-user-tie fa-fw w3-margin-right w3-large w3-text-teal"></i>Docentes</b></h4>
    """

    # DOCENTES
    data += """{% for i in range(0, len_doc, 3) %}
    <p><t class="w3-text-teal">Nome: </t>{{ docentes[i] }}</p>
    <p><t class="w3-text-teal">Gabinete: </t>{{ docentes[i+1] }}</p>
    <p><t class="w3-text-teal">Email: </t>{{ docentes[i+2] }}</p>
    <hr>
    {% endfor %}
    """

    # HORARIO
    data += """<h4><b class="w3-text-grey"><i class="fas fa-clock fa-fw w3-margin-right w3-large w3-text-teal"></i>Horário</b></h4>
    <p class="w3-text-teal">Aulas Teóricas:</p>
    <ul>
    {% for horario in horarios_t %}
    <li>{{ horario }}</li>
    {% endfor %}
    </ul>
    <p class="w3-text-teal">Aulas Práticas:</p>
    <ul>
    {% for horario in horarios_p %}
    <li>{{ horario }}</li>{% endfor %}
    </ul>
    <hr>
    """

    # AVALIACAO
    data += """<h4><b class="w3-text-grey"><i class="fas fa-file fa-fw w3-margin-right w3-large w3-text-teal"></i>Avaliação</b></h4>
    <ul>
    {% for i in range(0, len_aval, 2) %}
    <li>{{ avaliacao[i] }} ({{ avaliacao[i+1] }}%)</li>
    {% endfor %}
    </ul><hr>
    """

    # DATAS IMPORTANTES
    data += """<h4><b class="w3-text-grey"><i class="fas fa-calendar fa-fw w3-margin-right w3-large w3-text-teal"></i>Datas Importantes</b></h4>
    <ul>
    {% for i in range(0, len_dat, 2) %}
    <li>{{ datas[i] }} - {{ datas[i+1] }}</li>
    {% endfor %}
    </ul><hr>
    """
    
    data += "</div></div></div></div><div class=\"w3-twothird\">\n"
    f.write(data)

def menu(f):
    data = """<div class="w3-bar w3-teal">
    <a href="avisos.html" class="w3-bar-item w3-button">Avisos</a>
    <a href="exames.html" class="w3-bar-item w3-button">Exames</a>
    <a href="sumarios.html" class="w3-bar-item w3-button">Sumários</a>
    </div>
    <div class="w3-container w3-card w3-white w3-margin-bottom">
    """
    f.write(data)

def main():
    with open('templates/index.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)

        data = """{% for i in range(0, len_av, 3) %}
        <h3 class="w3-text-teal">{{ avisos[i] }} - {{ avisos[i+1] }}</h3>
        <p>{{ avisos[i+2] }}</p>
        <hr>
        {% endfor %}
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)

    # INFORMACAO
    with open('templates/informacao.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)

        data = """<h3 class="w3-text-teal">Nome</h3>
        <p>{{ inf1[0] }}</p>
        <h3 class="w3-text-teal">Código</h3>
        <p>{{ inf1[1] }}</p>
        <h3 class="w3-text-teal">Regime de Funcionamento</h3>
        <p>{{ inf1[2] }}</p>
        <h3 class="w3-text-teal">Número de ECTS</h3>
        <p>{{ inf1[3] }}</p>
        <h3 class="w3-text-teal">Áreas Científicas</h3>
        <ul>
        {% for i in range(0, len_inf2, 7) %}
        <li>{{ inf2[i] }}</li>
        </ul><h3 class="w3-text-teal">Tipo de Ensino</h3>
        <p>{{ inf2[i+1] }}</p>
        <h3 class="w3-text-teal">Tempo de Trabalho</h3>
        <p>Teóricas: {{ inf2[i+2] }}</p>
        <p>Práticas: {{ inf2[i+3] }}</p>
        <h3 class="w3-text-teal">Língua de Instrução</h3>
        <p>{{ inf2[i+4] }}</p>
        <h3 class="w3-text-teal">Modular</h3>
        <p>{{ inf2[i+5] }}</p>
        <h3 class="w3-text-teal">Conselho Pedagógico</h3>
        <p>{{ inf2[i+6] }}</p>
        {% endfor %}
        <h3 class="w3-text-teal">Cursos</h3>
        <ul>
        {% for inf in inf3 %}
        <li>{{ inf }}</li>
        {% endfor %}
        </ul>
        <h3 class="w3-text-teal">Objetivo de Ensino</h3>
        {% for inf in inf4 %}
        <p>{{ inf }}</p>
        {% endfor %}
        <h3 class="w3-text-teal">Resultados da Aprendizagem</h3>
        {% for inf in inf5 %}
        <p>{{ inf }}</p>
        {% endfor %}
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)

    # PROGRAMA
    with open('templates/programa.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)

        data = """<h3 class="w3-text-teal">Programa Sucinto</h3>
        {% for prog in prog1 %}
        <p>{{ prog }}</p>
        {% endfor %}
        <hr>
        <h3 class="w3-text-teal">Programa Detalhado</h3>
        {% for prog in prog2 %}
        <p>{{ prog }}</p>
        {% endfor %}
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)

    # DOCENTES
    with open('templates/docentes.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)

        data = """<h3 class="w3-text-teal">Coodenador</h3>
        {% for i in range(0, len_c, 2) %}
        <p><b class="w3-text-teal">{{ coord[i] }}: </b>{{ coord[i+1] }}</p>
        {% if loop.index % 6 == 0 %}
        <hr>
        {% endif %}
        {% endfor %}
        <h3 class="w3-text-teal">Docentes</h3>
        {% for i in range(0, len_d, 2) %}
        <p><b class="w3-text-teal">{{ doc[i] }}: </b>{{ doc[i+1] }}</p>
        {% if loop.index % 6 == 0 %}
        <hr>
        {% endif %}
        {% endfor %}
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)

    # BIBLIOGRAFIA
    with open('templates/bibliografia.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)

        data = """<h3 class="w3-text-teal">Bibliografia Essencial</h3>
        <ul>
        {% for bib in bib1 %}
        <li>{{ bib }}</li>
        {% endfor %}
        </ul>
        <hr>
        <h3 class="w3-text-teal">Bibliografia Complementar</h3>
        <ul>
        {% for bib in bib2 %}
        <li>{{ bib }}</li>
        {% endfor %}
        </ul>
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)

    # INFORMACAO COMPLEMENTAR
    with open('templates/informacao_comp.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)

        data = """<h3 class="w3-text-teal">Metodologia</h3>
        {% for m in met %}
        <p>{{ m }}</p>
        {% endfor %}
        <hr>
        <h3 class="w3-text-teal">Informação Adicional</h3>
        {% for i in inf %}
        <p>{{ i }}</p>
        {% endfor %}
        <hr>
        <h3 class="w3-text-teal">Material de Apoio</h3>
        {% for m in mat %}
        <p>{{ m }}</p>
        {% endfor %}
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)

    # METODOLOGIAS AVALIACAO
    with open('templates/metodologia.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)

        data = """<h3 class="w3-text-teal">Metodologia</h3>
        {% for m in met %}
        <p>{{ m }}</p>
        {% endfor %}
        <hr>
        <h3 class="w3-text-teal">Informação Adicional</h3>
        {% for i in inf %}
        <p>{{ i }}</p>
        {% endfor %}
        <hr>
        <h3 class="w3-text-teal">Avaliação</h3>
        {% for i in range(0, len, 2) %}
        {% if loop.index % 2 == 0 %}
        <p><b>{{ aval[i] }}: </b>{{ aval[i+1] }}%</p>
        <hr>
        {% else %}
        <p><b>{{ aval[i] }}: </b>{{ aval[i+1] }}</p>
        {% endif %}
        {% endfor %}
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)

    # AVISOS
    with open('templates/avisos.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)
        
        data = """{% for i in range(0, len_av, 3) %}
        <h3 class="w3-text-teal">{{ avisos[i] }} - {{ avisos[i+1] }}</h3>
        <p>{{ avisos[i+2] }}</p>
        <hr>
        {% endfor %}
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)

    # EXAMES
    with open('templates/exames.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)

        data = """<h1 class="w3-text-grey"><i class="fas fa-file-alt fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Exames</h1>
        <ul>
        {% for i in range(0, len, 2) %}
        <li><a href="exames.html/download?ref_id={{ exames[i] }}">{{ exames[i+1] }}</a>;</li>
        {% endfor %}
        </ul>
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)

    # SUMARIOS
    with open('templates/sumarios.html', 'w', encoding='utf-8') as f:
        leftcard(f)
        menu(f)

        data = """<h1 class="w3-text-grey"><i class="fas fa-chalkboard-teacher fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Aulas Teóricas</h1>
        <div class="w3-container">
        <div class="w3-bar w3-teal">
        {% for i in range(len_title) %}
        <div class="w3-bar-item"><a href="#T{{ i+1 }}">T{{ i+1 }}</a></div>
        {% endfor %}
        </div>
        </div>
        {% for i in range(0, len_t, 10) %}
        <div id="T{{ teoricas[i] }}"><h4 class="w3-text-teal">Aula Teórica {{ teoricas[i] }}: {{ teoricas[i+1] }}</h4></div>
        <p><b>{{ teoricas[i+2] }}: </b>{{ teoricas[i+3] }}</p>
        <p><b>{{ teoricas[i+4] }}: </b>{{ teoricas[i+5] }}</p>
        <p><b>{{ teoricas[i+6] }}: </b></p>
        <p>{{ teoricas[i+7] }}</p>
        <p><b>{{ teoricas[i+8] }}: </b>{{ teoricas[i+9] }}</p>
        {% endfor %}
        <hr>
        </div>
        <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h1 class="w3-text-grey"><i class="fas fa-chalkboard-teacher fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Aulas Práticas</h1>
        <div class="w3-container">
        <div class="w3-bar w3-teal">
        {% for i in range(len_title) %}
        <div class="w3-bar-item"><a href="#P{{ i+1 }}">P{{ i+1 }}</a></div>
        {% endfor %}
        </div>
        </div>
        {% for i in range(0, len_p, 10) %}
        <div id="P{{ praticas[i] }}"><h4 class="w3-text-teal">Aula Prática {{ praticas[i] }}: {{ praticas[i+1] }}</h4></div>
        <p><b>{{ praticas[i+2] }}: </b>{{ praticas[i+3] }}</p>
        <p><b>{{ praticas[i+4] }}: </b>{{ praticas[i+5] }}</p>
        <p><b>{{ praticas[i+6] }}: </b></p>
        <p>{{ praticas[i+7] }}</p>
        <p><b>{{ praticas[i+8] }}: </b>{{ praticas[i+9] }}</p>
        {% endfor %}
        <hr>
        </div>
        <div class="w3-container w3-card w3-white w3-margin-bottom">
        </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        """

        f.write(data)