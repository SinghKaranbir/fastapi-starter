FROM python:3.10

WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
COPY ./logging-conf.yaml /code/logging-conf.yaml

RUN pip install -r /code/requirements.txt
COPY ./app /code/app

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--log-config", "logging-conf.yaml"]