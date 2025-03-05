FROM python:3.12-slim-bookworm

LABEL maintainer="Jim Clausing, jclausing@isc.sans.edu"
LABEL version="capa v9.1.0"
LABEL date="2025-03-05"
LABEL description="Run capa in a docker container"

RUN apt-get update && apt-get -y install --no-install-recommends wget unzip ca-certificates \
  curl 

ENV PYTHONUNBUFFERED=1

# Install FLOSS
WORKDIR /tmp
RUN wget https://github.com/mandiant/capa/releases/download/v9.1.0/capa-v9.1.0-linux.zip \
  && unzip *-linux.zip && mv capa /usr/bin/ && rm *.zip \
  && useradd capa -m

USER capa

# Set the working directory to /app
WORKDIR /app

# Set the default command to run Floss 
ENTRYPOINT ["capa"]
CMD ["--help"]
