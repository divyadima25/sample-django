#!/usr/bin/env bash

# Install libaries
cd /home/ec2-user/django/django-app
virtualenv django_venv
source django_venv/bin/activate
pip install -r requirements.txt

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input
nohup python manage.py runserver 0.0.0.0:8000 &

# Restart services
sudo service nginx restart