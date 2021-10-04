FROM golang:1.16.5-alpine3.13 as builder

RUN apk --no-cache add make

RUN addgroup -g 1000 -S csqsiew && \
    adduser -u 1000 -S csqsiew -G csqsiew
USER csqsiew

COPY --chown=csqsiew:csqsiew ./src /go/src/github.com/go/singlishwords/
# COPY ./src /go/src/github.com/go/singlishwords/

WORKDIR /go/src/github.com/go/singlishwords

RUN mkdir -p .build && \
    cp config.yaml .build && \
    go mod download && \
    make linux

FROM alpine:3.13 as prod

RUN addgroup -g 1000 -S csqsiew && \
    adduser -u 1000 -S csqsiew -G csqsiew && \ 
    mkdir -p /var/log/singlishwords && \
    chown csqsiew:csqsiew -R /var/log/singlishwords

USER csqsiew

WORKDIR /opt/singlishwords/

COPY --from=builder --chown=csqsiew:csqsiew /go/src/github.com/go/singlishwords/.build/ ./
# COPY --from=builder /go/src/github.com/go/singlishwords/.build/ ./

CMD [ "/opt/singlishwords/sw_linux_amd64" ]