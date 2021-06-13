FROM golang:1.16.5-alpine3.13 as builder

COPY ./src /go/src/github.com/go/singlishwords/

WORKDIR /go/src/github.com/go/singlishwords

RUN apk --no-cache add make && \
    mkdir -p .build && \
    cp config.yaml .build/ 

RUN go mod download && \
    make linux

FROM alpine:3.13 as prod

WORKDIR /opt/singlishwords/

COPY --from=builder /go/src/github.com/go/singlishwords/.build/ ./
RUN mkdir -p /var/log/singlishwords

CMD [ "/opt/singlishwords/sw_linux_amd64" ]