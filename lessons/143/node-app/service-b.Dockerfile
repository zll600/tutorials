FROM node:18.20.8@sha256:c6ae79e38498325db67193d391e6ec1d224d96c693a8a4d943498556716d3783 AS build

WORKDIR /app

COPY service-b.js package*.json .

RUN npm ci --only=production

FROM gcr.io/distroless/nodejs18-debian11

COPY --from=build /app /app

WORKDIR /app

CMD ["service-b.js"]
