FROM python:3.6-alpine

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt