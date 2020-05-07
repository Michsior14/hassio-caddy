ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    jq \ 
    coreutils \
    && rm -rf /var/lib/apt/lists/*

ENV CADDYPATH /ssl

COPY run.sh /

CMD [ "/run.sh" ]
