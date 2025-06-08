FROM node:20.19.2 AS build

COPY . /app

WORKDIR /app

RUN npm ci --omit=dev

FROM gcr.io/distroless/nodejs20-debian12

COPY --from=build /app /app

WORKDIR /app

CMD ["app.js"]