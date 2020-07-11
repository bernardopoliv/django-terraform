FROM python:3.6-stretch

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /code

RUN apt-get update \
    && apt-get install -y zip apt-utils libpango-1.0 \
    libcairo2-dev libzbar-dev postgresql-client

RUN pip3.6 install pip==20.1.1

RUN wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
RUN unzip terraform_0.12.24_linux_amd64.zip
RUN install terraform /usr/local/bin/

ADD requirements.txt /code/
ADD requirements-dev.txt /code/
RUN pip install -r requirements-dev.txt

COPY ./compose/start /start
RUN sed -i 's/\r//' /start
RUN chmod +x /start

ADD . /code/
