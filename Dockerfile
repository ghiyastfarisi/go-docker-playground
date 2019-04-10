FROM golang:1.12-alpine as builder
WORKDIR /app
COPY . .
RUN apk add --no-cache --virtual git
RUN go mod tidy && go build -o go-docker-playground .


FROM alpine as dev
WORKDIR /app
COPY --from=builder /app/go-docker-playground /app/
CMD [ "./go-docker-playground"  ]

FROM alpine
WORKDIR /app
COPY --from=dev /app/go-docker-playground /app/
CMD [ "./go-docker-playground"  ]
