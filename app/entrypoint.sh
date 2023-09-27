# #!/bin/sh

# if [ "$DATABASE" = "postgres" ]
# then
#     # если база еще не запущена
#     echo "DB not yet run..."

#     # Проверяем доступность хоста и порта
#     while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
#       sleep 0.1
#     done

#     echo "DB did run."
# fi
# # Удаляем все старые данные
# python manage.py flush --no-input
# # Выполняем миграции
# python manage.py migrate

# exec "$@"

#!/bin/sh
# wait-for-postgres.sh
set -e
host="$1"
shift
cmd="$@"
until PGPASSWORD="dante123456" psql -h "$host" -d "library" -U "dante" -c '\q';>
>&2 echo "Postgres is unavailable - sleeping"
sleep 1
done
>&2 echo "Postgres is up - executing command"
exec $cmd