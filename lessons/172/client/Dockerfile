FROM golang:1.24.4-bullseye AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download && go mod verify

COPY main.go .

RUN go build -o /main main.go

FROM gcr.io/distroless/base-debian12

COPY --from=build /main /main

ENTRYPOINT ["/main"]
