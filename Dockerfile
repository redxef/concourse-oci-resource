FROM gcr.io/go-containerregistry/crane as crane
FROM alpine
COPY --from=crane /ko-app/crane /usr/local/bin/crane
RUN apk add --no-cache jq
COPY ./src/ /opt/resource/
