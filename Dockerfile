FROM python:3.8-slim-buster

RUN apt update -y && apt install awscli -y
WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt
RUN pip install --upgrade accelerate
RUN pip uninstall -y transformers accelerate
RUN pip install transformers accelerate
RUN pip install --upgrade datasets
RUN pip uninstall -y datasets
RUN pip install datasets==2.21.0

CMD ["python3", "app.py"]