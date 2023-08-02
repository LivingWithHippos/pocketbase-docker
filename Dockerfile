  FROM alpine as downloader

  ARG pocket_version=0.17.1
  ARG pocket_url=https://github.com/pocketbase/pocketbase/releases/download/v${pocket_version}/pocketbase_${pocket_version}_linux_amd64.zip

  ADD $pocket_url /tmp/pocketbase.zip
  RUN unzip /tmp/pocketbase.zip -d /tmp/
  RUN chmod +x /tmp/pocketbase

  FROM gcr.io/distroless/static-debian11

  COPY --from=downloader /tmp/pocketbase /pocketbase

  CMD ["/pocketbase", "serve", "--http=0.0.0.0:8090"]
