FROM public.ecr.aws/lambda/nodejs:22@sha256:d46cc9b761ae7e4ce2e7c3e5929fb4ba5d57f2a737ece5917e528e72dddf4b08

COPY *.js package*.json  /var/task/

RUN npm ci --production

CMD [ "app.handler" ]
