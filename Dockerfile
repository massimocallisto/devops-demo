# syntax=docker/dockerfile:1

FROM ubuntu:22.04

# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# install app
RUN mkdir -p /app
COPY main.py /app


RUN mkdir -p /data


# /app/main.py


# final configuration

ENV FLASK_APP=main

EXPOSE 8000

#CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
CMD ["/usr/bin/python3", "-u", "/app/main.py"]
