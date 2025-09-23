ARG BUILDPLATFORM
FROM --platform=${BUILDPLATFORM} caddy:2-builder AS builder

ARG TARGETOS
ARG TARGETARCH

RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
