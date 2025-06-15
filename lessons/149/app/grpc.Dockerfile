FROM golang:1.20.5-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download && go mod verify

COPY serializer serializer
COPY event event
COPY cmd/grpc-server cmd/grpc-server

RUN go build -o /myapp cmd/grpc-server/main.go

FROM gcr.io/distroless/base-debian12

COPY --from=build /myapp /myapp

ENTRYPOINT ["/myapp"]
