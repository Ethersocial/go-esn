FROM alpine:3.7

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 --branch release/1.8 https://github.com/ethersocial/go-esn && \
  (cd go-esn && make geth) && \
  cp go-esn/build/bin/geth /geth && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-esn && rm -rf /var/cache/apk/*

EXPOSE 9545
EXPOSE 50505

ENTRYPOINT ["/geth"]
