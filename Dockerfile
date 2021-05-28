
FROM python:3.8

WORKDIR /app

ADD requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt

ADD . /app

CMD gunicorn --bind 0.0.0.0:8980 -w 3 --log-level=info wsgi:app

EXPOSE 8980

## Dockerfile for db-api
#
### build the docker container
# docker build -t db-api:1.0.0 .
#
### run the docker container local
# docker run -p 8980:8980 -it db-api:1.0.0
#
### push the docker container to registry
# docker push registry:5000/db-api:1.0.0
#
### public registry
# https://hub.docker.com/r/dcsops/db-api
#
