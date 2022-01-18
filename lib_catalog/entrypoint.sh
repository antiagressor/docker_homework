#!/bin/bash

file="initiate"
if [ ! -f "$file" ];
then
   python manage.py migrate && python manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('$DJANGO_SUPERUSER_USERNAME', '$DJANGO_SUPERUSER_EMAIL', '$DJANGO_SUPERUSER_PASSWORD')" && python manage.py runserver 0.0.0.0:8000 \ 
   touch initiate
else
   python manage.py runserver 0.0.0.0:8000
fi
