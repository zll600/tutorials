FROM rust:1.87.0-bookworm AS build

WORKDIR /app

COPY . .

RUN cargo build --release

FROM gcr.io/distroless/base-debian12

COPY --from=build /app/target/release/ntex-app /server

CMD ["/server"]
