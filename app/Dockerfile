# образ на основе которого создаём контейнер
FROM python:3.8

# рабочая директория внутри проекта
WORKDIR /app

# переменные окружения для python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
&& apt-get install -y postgresql postgresql-contrib libpq-dev python3-dev gcc musl-dev
# устанавливаем зависимости
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY entrypoint.sh .


# копируем содержимое текущей папки в контейнер
COPY . .
RUN chmod +x entrypoint.sh

# ENTRYPOINT ["/usr/src/app/entrypoint.sh"]