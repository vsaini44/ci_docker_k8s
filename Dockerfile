FROM python:3.11-slim-bookworm

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && apt-get upgrade -y
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app.app:app"]
