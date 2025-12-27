FROM node:22.16.0@sha256:0b5b940c21ab03353de9042f9166c75bcfc53c4cd0508c7fd88576646adbf875 AS build

WORKDIR /app

COPY service-b.js package*.json .

RUN npm ci --only=production

FROM gcr.io/distroless/nodejs18-debian11

COPY --from=build /app /app

WORKDIR /app

CMD ["service-b.js"]
