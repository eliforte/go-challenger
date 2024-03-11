FROM golang:1.22.1-alpine3.18 AS builder

WORKDIR /app

COPY . .

RUN go build -o main

FROM scratch AS app
WORKDIR /app
COPY --from=builder /app/main .
CMD [ "./main" ]