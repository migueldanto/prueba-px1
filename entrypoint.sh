#!/bin/sh

#if [ "$DATABASE" = "postgres" ]
#then
    echo "Waiting for postgres..."

    while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
#fi

#python manage.py flush --no-input
python manage.py makemigrations 
python manage.py migrate
#Crear el grupo admin
python manage.py loaddata fixtures/groups.json
#crear un superusuario aqui 
python manage.py g_superuser
#creando los datos random
#python manage.py g_random1

python manage.py collectstatic --noinput

gunicorn form_variantes.wsgi:application --bind 0.0.0.0:8000
