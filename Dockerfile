FROM python:3.11-buster

EXPOSE 8051

WORKDIR /app

COPY . .

RUN pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --only main

CMD ["poetry", "run", "actigraphy", "/data"]
