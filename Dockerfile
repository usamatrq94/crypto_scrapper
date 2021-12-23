FROM prefecthq/prefect:latest-python3.7
  
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p scrapper

ENV PYTHONPATH "${PYTHONPATH}:/scrapper"

COPY * ./scrapper/

RUN pip install -r scrapper/requirements.txt

WORKDIR /scrapper

