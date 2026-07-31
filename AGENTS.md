READ ${CODE_ROOT:-$HOME/Code}/agent-scripts/AGENTS.md BEFORE ANYTHING (skip if missing). If missing, also try: $HOME/repos/agent-scripts/AGENTS.md

# AGENTS.md

## Project

- This repository builds a minimal Alpine image for GoReleaser Pro.
- Sawmills maintains the image.
- The image entrypoint is `goreleaser`.
- Images publish to `ghcr.io/sawmills/goreleaser-alpine`.

## Map

- `Dockerfile` defines the image, packages, tools, and entrypoint.
- `install.sh` installs GoReleaser Pro during the image build.
- `README.md` documents image tags, build arguments, CI behavior, and usage.
- `.github/workflows/ci.yml` defines image builds, publishing, and releases.
- `LICENSE` contains the repository license.

## Commands

- Pull an example versioned image:
  `docker pull ghcr.io/sawmills/goreleaser-alpine:go1.24.3-goreleaserv2.9.0-alpine3.21`
- Check the image version:
  `docker run --rm ghcr.io/sawmills/goreleaser-alpine:go1.24.3-goreleaserv2.9.0-alpine3.21 --version`
- For Docker-in-Docker, start the daemon with:
  `dockerd &`

## Rules

- Keep `GO_VERSION`, `ALPINE_VERSION`, and `GORELEASER_VERSION` as Docker build arguments.
- Keep the base image format `golang:${GO_VERSION}-alpine${ALPINE_VERSION}`.
- Keep GoReleaser Pro releases sourced from `https://github.com/goreleaser/goreleaser-pro/releases`.
- Keep `buf` pinned to `v1.54.0`.
- Keep the image entrypoint as `goreleaser`.
- Preserve versioned, `latest`, and commit SHA image tags.
- Build pull requests without pushing images.
- Build and push images on pushes to `main`.
- Use `.github/workflows/ci.yml` as the source of truth for CI details.
