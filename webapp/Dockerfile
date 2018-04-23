FROM tiangolo/uwsgi-nginx-flask:python3.6

COPY ./app /app
COPY ./conf/requirements.txt requirements.txt

RUN pip install -r requirements.txt