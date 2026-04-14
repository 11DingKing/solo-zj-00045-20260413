FROM python:3.10-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --timeout=120 -r requirements.txt
COPY . .
RUN python manage.py migrate --no-input
RUN python manage.py collectstatic --no-input
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
