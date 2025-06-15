FROM public.ecr.aws/lambda/nodejs:22@sha256:2390a1ca75817a3c88c822a17999277cb001ab18850bbcad1158fba46355aa10

COPY app.js package*.json /var/task/

RUN npm ci --only=production

CMD [ "app.hello" ]
