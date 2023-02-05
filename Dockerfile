FROM golang:alpine3.16

RUN mkdir /app
COPY . /app
WORKDIR /app

ENV PORT $PORT
EXPOSE $PORT

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "executable" ]

RUN go build -o main .
CMD ["/app/main"]