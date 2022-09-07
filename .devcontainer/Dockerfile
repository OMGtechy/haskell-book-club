# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.231.6/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
    build-essential \
    curl \
    libffi-dev \
    libgmp-dev \
    libncurses-dev \
    libpq-dev \
    zlib1g-dev \
    libnuma-dev \
    jq

ARG GHCUP_BIN_DIR=/root/.ghcup/bin
ENV PATH=${PATH}:${GHCUP_BIN_DIR}

# Instance GHCUP
ENV BOOTSTRAP_HASKELL_MINIMAL=1
ENV BOOTSTRAP_HASKELL_NONINTERACTIVE=1
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

RUN ghcup upgrade
RUN ghcup install ghc 9.0.2 && ghcup install stack 2.7.5 && ghcup install hls 1.7.0.0 && ghcup install cabal 3.6.2.0
RUN ghcup set ghc 9.0.2 && ghcup set stack 2.7.5 && ghcup set cabal 3.6.2.0

# Populate cache
RUN stack path

# Clean up env
ENV BOOTSTRAP_HASKELL_MINIMAL=
ENV BOOTSTRAP_HASKELL_NONINTERACTIVE=
