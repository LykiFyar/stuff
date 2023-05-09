FROM python

RUN pip install requests

WORKDIR /app

COPY clav.py .

RUN ["python", "clav.py"]

EXPOSE 8000

CMD python -m http_server