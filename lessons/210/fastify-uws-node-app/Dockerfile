FROM node:22.16.0@sha256:0b5b940c21ab03353de9042f9166c75bcfc53c4cd0508c7fd88576646adbf875 AS build

COPY . /app

WORKDIR /app

RUN npm ci --omit=dev

FROM gcr.io/distroless/nodejs20-debian12

COPY --from=build /app /app

WORKDIR /app

CMD ["app.js"]