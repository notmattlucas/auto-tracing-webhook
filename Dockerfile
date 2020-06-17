FROM python:3.6-alpine

RUN apk update && apk add gcc libc-dev libffi-dev openssl openssl-dev

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY webhook.py webhook.py

COPY keys/* ./

ENTRYPOINT ["python", "webhook.py"]
