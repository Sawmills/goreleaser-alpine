#!/usr/bin/env sh
set -e

echo "Using Pro distribution..."
RELEASES_URL="https://github.com/goreleaser/goreleaser-pro/releases"
FILE_BASENAME="goreleaser-pro"
LATEST="$(curl -sf https://goreleaser.com/static/latest-pro)"

test -z "$GORELEASER_VERSION" && GORELEASER_VERSION="$LATEST"

test -z "$GORELEASER_VERSION" && {
	echo "Unable to get goreleaser version." >&2
	exit 1
}

TMP_DIR="$(mktemp -d)"
# shellcheck disable=SC2064 # intentionally expands here
trap "rm -rf \"$TMP_DIR\"" EXIT INT TERM

ARCH="$(uname -m)"
test "$ARCH" = "arm64" && ARCH="aarch64"
STRIPPED_VERSION="${GORELEASER_VERSION#v}"
APK_FILE="${FILE_BASENAME}_${STRIPPED_VERSION}_${ARCH}.apk"

(
	cd "$TMP_DIR"
	DOWNLOAD_URL="$RELEASES_URL/download/$GORELEASER_VERSION/$APK_FILE"
	echo "Downloading GoReleaser $GORELEASER_VERSION from $DOWNLOAD_URL..."
	curl -sfLO "$DOWNLOAD_URL"
)

apk add --no-cache --allow-untrusted "$TMP_DIR/$APK_FILE"
