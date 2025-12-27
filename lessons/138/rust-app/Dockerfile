FROM amd64/rust:1.87.0-bullseye as build

WORKDIR /app

COPY . .

RUN cargo build --release

FROM debian:12.11-slim@sha256:90522eeb7e5923ee2b871c639059537b30521272f10ca86fdbbbb2b75a8c40cd

COPY --from=build /app/target/release/rust-app /rust-app

CMD ["/rust-app"]
