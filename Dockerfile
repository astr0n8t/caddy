ARG BUILDPLATFORM=linux/amd64
ARG TARGETOS
ARG TARGETARCH

FROM --platform=$BUILDPLATFORM caddy:2-builder AS builder

RUN GOOS=$TARGETOS GOARCH=$TARGETARCH xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
