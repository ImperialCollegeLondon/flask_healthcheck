FROM python:3.9-slim

WORKDIR /usr/src/app/
ADD requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
ADD app.py .

CMD flask run --host=0.0.0.0
EXPOSE 5000
