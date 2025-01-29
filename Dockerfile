## Build it
FROM ghcr.io/getzola/zola:v0.19.2 as builder

WORKDIR /app
COPY . .
RUN ["zola", "build"]


## Run it
# FROM nginx:alpine AS runner

# COPY --from=builder /app/public/ ./
# COPY ./nginx.conf /etc/nginx/nginx.conf

# EXPOSE 8080

FROM joseluisq/static-web-server:2
COPY --from=builder /app/public /public
ENV SERVER_PORT 8080
