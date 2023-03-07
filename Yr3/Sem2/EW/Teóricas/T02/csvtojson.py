import re
import json

list = []
with open("alunos.csv", encoding='utf-8') as file:
    for line in file.readlines():
        currelem = re.match(r"(?P<id>\w*);(?P<nome>[^;]*);(?P<repo>[^\n\r]*)",line)
        if currelem is not None:
            list.append(currelem.groupdict())

alunos = {}
alunos['alunos'] = list

with open("alunos1.json", "w", encoding='utf-8') as newfile:
    json.dump(alunos,newfile)