import os
from flask import Flask, render_template, request, send_file
import xml.etree.ElementTree as ET
import xml2html

xml2html.main()

app = Flask(__name__)

@app.route('/')
def homepage():
    path = 'DUCs/'
    files = os.listdir(path)

    html = """<!DOCTYPE html>
    <html><head><title>DUCs</title></head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }
      .w3-bar-block-container {
        width: 25%;
      }
    </style>
    <script src="https://kit.fontawesome.com/83260f98e0.js" crossorigin="anonymous"></script>
    <div class="w3-quarter">
    <div class="w3-white w3-text-grey w3-card-4">
    <div class="w3-display-container">
    <div class="w3-container w3-teal">
    <div class="w3-bar-block w3-teal">
    <div class="w3-text-white"><h4><center>Dossiers de Unidade Curricular</center></h4></div>
    {% for duc in ducs %}
    <p><center><a href="/index.html?ref_id={{ duc }}" class="w3-bar-item w3-button">{{ duc }}</a></center></p>
    {% endfor %}
    </div></div></div></div></div></html>
    """
    ducs = []
    for file in files:
        ducs.append(file)

    with open('templates/homepage.html', 'w', encoding='utf-8') as f:
        f.write(html)

    return render_template('homepage.html', ducs=ducs)

def leftcard():
    title = root[0][0].text
    docentes = []
    for child in root[2]:
        docentes.extend([child[0].text, child[4].text, child[1].text])
    
    horarios_t = []
    for child in root[3][0]:
        horarios_t.append(child.text)
    
    horarios_p = []
    for child in root[3][1]:
        horarios_p.append(child.text)
    
    avaliacao = []
    for i in range(2,len(root[6])):
        avaliacao.extend([root[6][i][0].text, root[6][i][1].text])

    datas = []
    for child in root[7]:
        datas.extend([child[0].text, child[1].text])

    return title, docentes, horarios_t, horarios_p, avaliacao, datas

@app.route('/index.html')
def index():
    xml = request.args.get('ref_id')
    tree = ET.parse('DUCs/' + xml)
    global root
    root = tree.getroot()

    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()

    t = root[8]
    avisos = []
    p = ''
    for child in t:
        avisos.extend([child[1].text, child[0].text])
        for child2 in child[2]:
            p += str(child2.text) + '\n'
        avisos.append(p)

    return render_template('index.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas), avisos=avisos, len_av = len(avisos))

@app.route('/informacao.html')
def informacao():
    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()

    title2 = root[0]
    inf1 = [title2[0].text, title2[1].text, title2[2].text, title2[3].text]
    inf2, inf3, inf4, inf5 = [], [], [], []
    for child in title2[4]:
        inf2.extend([child.text, title2[5].text, title2[6][0].text, title2[6][1].text, title2[7].text, title2[8].text, title2[9].text])
    for child in title2[10]:
        inf3.append(child.text)
    for child in title2[11]:
        inf4.append(child.text)
    for child in title2[12]:
        inf5.append(child.text)

    return render_template('informacao.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas),
                           inf1=inf1, inf2=inf2, len_inf2=len(inf2), inf3=inf3, inf4=inf4, inf5=inf5)

@app.route('/programa.html')
def programa():
    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()

    title2 = root[1]
    prog1, prog2 = [], []
    for child in title2[0]:
        prog1.append(child.text)
    for child in title2[1]:
        prog2.append(child.text)

    return render_template('programa.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas), prog1=prog1, prog2=prog2)

@app.route('/docentes.html')
def docentes():
    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()

    title2 = root[2]
    coord, doc = [], []
    for child in title2:
        try:
            if child.attrib['Coordenador'] == 'true':
                print(child[0].text)
                for child2 in child:
                    coord.extend([child2.tag, child2.text])
        except: pass
    for child in title2:
        for child2 in child:
            doc.extend([child2.tag, child2.text])

    return render_template('docentes.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas), coord=coord, len_c=len(coord), doc=doc, len_d=len(doc))

@app.route('/bibliografia.html')
def bibliografia():
    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()

    title2 = root[4]
    bib1, bib2 = [], []
    for child in title2[0]:
        bib1.append(child[1].text)
    if len(title2) > 1:
        for child in title2[1]:
            bib2.append(child[1].text)

    return render_template('bibliografia.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas), bib1=bib1, bib2=bib2)

@app.route('/informacao_comp.html')
def informacao_comp():
    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()

    title2 = root[5]
    met, inf, mat = [], [], []
    for child in title2[0]:
        met.append(child.text)
    for child in title2[1]:
        inf.append(child.text)
    for child in title2[2]:
        mat.append(child.text)

    return render_template('informacao_comp.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas), met=met, inf=inf, mat=mat)

@app.route('/metodologia.html')
def metodologia():
    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()

    title2 = root[6]
    met, inf, aval = [], [], []
    for child in title2[0]:
        met.append(child.text)
    for child in title2[1]:
        inf.append(child.text)
    for i in range(2,len(title2)):
        for child in title2[i]:
            aval.extend([child.tag, child.text])

    return render_template('metodologia.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas),
                           met=met, inf=inf, aval=aval, len=len(aval))

@app.route('/avisos.html')
def avisos():
    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()
    
    t = root[8]
    avisos = []
    p = ''
    for child in t:
        avisos.extend([child[1].text, child[0].text])
        for child2 in child[2]:
            p += str(child2.text) + '\n'
        avisos.append(p)

    return render_template('avisos.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas), avisos=avisos, len_av = len(avisos))

@app.route('/exames.html')
def exames():
    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()

    title2 = root[9]
    exames = []
    if len(title2[0]) != 0:
        for child in title2:
            exames.extend([child[0].attrib['target'], child[0].text])

    return render_template('exames.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas), exames=exames, len=len(exames))

@app.route('/exames.html/download')
def download():
    file = request.args.get('ref_id')
    print(file)

    return send_file(file, as_attachment=True)


@app.route('/sumarios.html')
def sumarios():
    title, docentes, horarios_t, horarios_p, avaliacao, datas = leftcard()
    
    title2 = root[10]
    teoricas = []
    n = 1
    for child in title2[0]:
        p_t, assiduidade_t = '', ''
        teoricas.extend([n, child[0].text])
        n += 1
        for i in range(1,3):
            teoricas.extend([child[i].tag, child[i].text])
        teoricas.append(child[3].tag)
        for child2 in child[3]:
            p_t += str(child2.text) + '\n'
        teoricas.append(p_t)
        teoricas.append(child[4].tag)
        for child2 in child[4]:
            if child2.tag == "Ausentes":
                assiduidade_t += str(child2.text) + ' ' + child2.tag
            else:
                assiduidade_t += str(child2.text) + ' ' + child2.tag + ', '
        teoricas.append(assiduidade_t)
    
    praticas = []
    n = 1
    for child in title2[1]:
        p_p, assiduidade_p = '', ''
        praticas.extend([n, child[0].text])
        n += 1
        for i in range(1,3):
            praticas.extend([child[i].tag, child[i].text])
        praticas.append(child[3].tag)
        for child2 in child[3]:
            p_p += str(child2.text) + '\n'
        praticas.append(p_p)
        praticas.append(child[4].tag)
        for child2 in child[4]:
            if child2.tag == "Ausentes":
                assiduidade_p += str(child2.text) + ' ' + child2.tag
            else:
                assiduidade_p += str(child2.text) + ' ' + child2.tag + ', '
        praticas.append(assiduidade_p)


    return render_template('sumarios.html', title=title, docentes=docentes, len_doc=len(docentes),
                           horarios_t=horarios_t, horarios_p=horarios_p, avaliacao=avaliacao, len_aval=len(avaliacao),
                           datas=datas, len_dat=len(datas), len_title=len(title2[0]), teoricas=teoricas, len_t=len(teoricas),
                           praticas=praticas, len_p=len(praticas))
    
if __name__ == '__main__':
    app.run()