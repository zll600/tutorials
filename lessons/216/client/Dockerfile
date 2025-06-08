FROM golang:1.24.4-bookworm AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download && go mod verify

COPY . .

RUN go generate

RUN CGO_ENABLED=0 GOOS=linux go build -o server -a -ldflags="-s -w" -installsuffix cgo

FROM scratch

COPY --from=build /app/server /server

ENTRYPOINT ["/server"]