ARG GO_VERSION
ARG ALPINE_VERSION
ARG GORELEASER_VERSION
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION}

ENV GORELEASER_VERSION=${GORELEASER_VERSION}
ENV RELEASES_URL="https://github.com/goreleaser/goreleaser-pro/releases"
ENV FILE_BASENAME="goreleaser-pro"

RUN apk add --no-cache wget curl coreutils docker build-base binutils-gold openssl openssh helm

RUN go install github.com/bufbuild/buf/cmd/buf@v1.54.0

COPY install.sh /install.sh

RUN chmod +x /install.sh && \
  /install.sh
RUN rm /install.sh

# To use Docker-in-Docker, start the daemon with: dockerd &

ENTRYPOINT ["goreleaser"]
