FROM golang:1.20.5-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download && go mod verify

COPY cmd/exporter/ ./cmd/exporter
COPY basic_collector.go basic.go .

RUN go build -o /exporter cmd/exporter/main.go

FROM gcr.io/distroless/base-debian12

COPY --from=build /exporter /exporter

ENTRYPOINT ["/exporter"]
