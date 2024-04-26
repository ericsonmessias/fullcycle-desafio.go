FROM golang:1.22.2 AS builder

WORKDIR /go/src/desafio

COPY ./desafio.go .

RUN export GOOS=linux

RUN go mod init desafio

RUN go build

FROM scratch

COPY --from=builder /go/src/desafio/desafio /

CMD [ "/desafio" ]