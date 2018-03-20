FROM alpine:3.5

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 https://github.com/ethersocial/go-esc && \
  (cd go-esc && make geth) && \
  cp go-esc/build/bin/geth /geth && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-esc && rm -rf /var/cache/apk/*

EXPOSE 9545
EXPOSE 50505

ENTRYPOINT ["/geth"]
