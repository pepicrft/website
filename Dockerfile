FROM ghcr.io/getzola/zola:v0.22.1 AS builder

WORKDIR /site
COPY . .
RUN ["zola", "build"]

FROM nginxinc/nginx-unprivileged:1.29.3-alpine

COPY --from=builder /site/build /usr/share/nginx/html

EXPOSE 8080
