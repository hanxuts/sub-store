FROM alpine

WORKDIR /opt/app

RUN apk add --no-cache nodejs \
    && apk add --no-cache unzip

ADD https://github.com/sub-store-org/Sub-Store/releases/latest/download/sub-store.bundle.js /opt/app/sub-store.bundle.js

ADD https://github.com/sub-store-org/Sub-Store-Front-End/releases/latest/download/dist.zip /opt/app/dist.zip

RUN unzip dist.zip \
    && mv dist frontend \
    && rm dist.zip

ENV SUB_STORE_FRONTEND_PATH=/opt/app/frontend \
    SUB_STORE_DATA_BASE_PATH=/opt/app/data

CMD mkdir -p /opt/app/data \
    && node /opt/app/sub-store.bundle.js
