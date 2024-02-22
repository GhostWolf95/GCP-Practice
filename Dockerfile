FROM python:3.10-slim

ENV PORT 8080

COPY . ./

RUN pip install -r requirements.txt

CMD exec gunicorn --bin :$PORT --workers 1 --threads 8 --timeout 0 main:app