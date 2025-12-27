FROM python:3.13.4

COPY main.py .

ENTRYPOINT [ "python3", "main.py"]
