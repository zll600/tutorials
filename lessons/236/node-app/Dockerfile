FROM node:23.11.1-bookworm AS build

COPY . /app

WORKDIR /app

RUN npm ci --omit=dev

FROM node:23.11.1-bookworm-slim

COPY --from=build /app /app

WORKDIR /app

CMD ["app.js"]