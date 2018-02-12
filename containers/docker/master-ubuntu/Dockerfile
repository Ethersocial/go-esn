FROM ubuntu:xenial

RUN \
  apt-get update && apt-get upgrade -q -y && \
  apt-get install -y --no-install-recommends golang git make gcc libc-dev ca-certificates && \
  git clone --depth 1 --branch release/1.7 https://github.com/ethersocial/go-esc && \
  (cd go-esc && make geth) && \
  cp go-esc/build/bin/geth /geth && \
  apt-get remove -y golang git make gcc libc-dev && apt autoremove -y && apt-get clean && \
  rm -rf /go-esc

EXPOSE 9545
EXPOSE 50505

ENTRYPOINT ["/geth"]
