FROM golang:alpine AS build-env
WORKDIR /usr/local/go/src/github.com/keel-hq/push-workflow-example
COPY . /usr/local/go/src/github.com/keel-hq/push-workflow-example
RUN go install -ldflags="-w -s"

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build-env /usr/local/go/bin/push-workflow-example /bin/push-workflow-example
CMD ["push-workflow-example"]

EXPOSE 8500