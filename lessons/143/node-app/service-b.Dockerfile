FROM node:22.16.0@sha256:71bcbb3b215b3fa84b5b167585675072f4c270855e37a599803f1a58141a0716 AS build

WORKDIR /app

COPY service-b.js package*.json .

RUN npm ci --only=production

FROM gcr.io/distroless/nodejs18-debian11

COPY --from=build /app /app

WORKDIR /app

CMD ["service-b.js"]
