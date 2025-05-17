# goreleaser-alpine

A minimal Docker image for [GoReleaser Pro](https://goreleaser.com/pro/) built on Alpine Linux, maintained by [Sawmills](https://github.com/sawmills).

## Image Tags

Images are published to [GitHub Container Registry (GHCR)](https://ghcr.io) as:

```text
ghcr.io/sawmills/goreleaser-alpine:go<GO_VERSION>-goreleaser<GORELEASER_VERSION>-alpine<ALPINE_VERSION>
ghcr.io/sawmills/goreleaser-alpine:latest
ghcr.io/sawmills/goreleaser-alpine:<commit-sha>
```

Example:

```sh
docker pull ghcr.io/sawmills/goreleaser-alpine:go1.24.3-goreleaserv2.9.0-alpine3.21
```

## Build Arguments

- `GO_VERSION` (e.g. `1.24.3`)
- `ALPINE_VERSION` (e.g. `3.21`)
- `GORELEASER_VERSION` (e.g. `v2.9.0`)

These are set in the [GitHub Actions workflow](.github/workflows/ci.yml) and passed to the Docker build.

## GitHub Actions CI

- On every push to `main`, the workflow builds and pushes the image to GHCR with versioned, `latest`, and commit SHA tags.
- On pull requests, the image is built but not pushed.
- See [.github/workflows/ci.yml](.github/workflows/ci.yml) for details.

## Usage Example

```sh
docker run --rm ghcr.io/sawmills/goreleaser-alpine:go1.24.3-goreleaserv2.9.0-alpine3.21 --version
```

## License

See [LICENSE](LICENSE).
