ARG BUILDPLATFORM TARGETOS TARGETARCH TARGETPLATFORM

FROM --platform=$BUILDPLATFORM caddy:2-builder AS builder

RUN GOOS=$TARGETOS GOARCH=$TARGETARCH xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM --platform=$TARGETPLATFORM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
