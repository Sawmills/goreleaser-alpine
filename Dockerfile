ARG GO_VERSION
ARG ALPINE_VERSION
ARG GORELEASER_VERSION
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION}

ENV RELEASES_URL="https://github.com/goreleaser/goreleaser-pro/releases"
ENV FILE_BASENAME="goreleaser-pro"
ENV GORELEASER_VERSION=${GORELEASER_VERSION}

RUN apk add --no-cache wget curl coreutils docker build-base binutils-gold \
    && rm -rf /var/cache/apk/*

COPY install.sh /install.sh

RUN chmod +x /install.sh && \
  /install.sh
RUN apk del wget curl coreutils && \
  rm /install.sh

# To use Docker-in-Docker, start the daemon with: dockerd &

ENTRYPOINT ["goreleaser"]
