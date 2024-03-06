FROM golang:1.22.1-alpine AS build

WORKDIR /app
COPY src/rocks.go .
RUN go build rocks.go

FROM scratch AS app

COPY --from=build /app/rocks .
ENTRYPOINT [ "./rocks" ]