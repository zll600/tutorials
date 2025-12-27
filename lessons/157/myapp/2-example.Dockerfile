FROM python:3.11.4-slim-buster

COPY main.py .

ENTRYPOINT [ "python3", "main.py"]
