FROM python

WORKDIR /app

COPY app.py .
COPY templates templates/
COPY DUCs DUCs/
COPY xml2html.py .

EXPOSE 5000

RUN pip install --upgrade pip
RUN pip install -U Flask

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
