rootdir = $(realpath .)
all: build up create_user_db yarn_build collectstatic create_cache_table migrate_db import_data
all_no_cache: build_no_cache up yarn_build collectstatic create_user_db create_cache_table migrate_db import_data

init:
	pip install -r requirements.txt

create_user_db:
	docker exec --user postgres pokepare_db /bin/sh -c "psql -tc \"SELECT 1 FROM pg_user WHERE usename = 'pokepare'\" | grep -q 1 || (createuser pokepare -s && createdb -U pokepare pokepare)"

create_cache_table:
	docker exec pokepare_py /bin/sh -c "python manage.py createcachetable" 

migrate_db:
	docker exec pokepare_py /bin/sh -c 'python manage.py makemigrations'
	docker exec pokepare_py /bin/sh -c 'python manage.py migrate'

flush_db:
	docker exec pokepare_py /bin/sh -c 'python manage.py flush --no-input'

import_data:
	docker exec pokepare_py /bin/sh -c 'python manage.py import_data all'

import_pokemons:
	docker exec pokepare_py /bin/sh -c 'python manage.py import_data pokemons'

import_languages:
	docker exec pokepare_py /bin/sh -c 'python manage.py import_data languages'

import_cards:
	docker exec pokepare_py /bin/sh -c 'python manage.py import_data cards'

import_cardsets:
	docker exec pokepare_py /bin/sh -c 'python manage.py import_data cardsets'

add_images:
	docker exec pokepare_py /bin/sh -c 'python manage.py add_images all /usr/src/app/public/media/cards/'

cov_test:
	docker exec pokepare_py /bin/sh -c 'coverage run manage.py test'

cov_report:
	docker exec pokepare_py /bin/sh -c 'coverage report'

build:
	docker-compose build

build_no_cache:
	docker-compose build --no-cache

up:
	docker-compose up -d

up_no_d:
	docker-compose up

restart:
	docker-compose restart

collectstatic:
	docker exec pokepare_py /bin/sh -c "python manage.py collectstatic --noinput"

bash_nginx:
	docker exec -ti pokepare_nginx bash

bash_web:
	docker exec -ti pokepare_py bash

bash_db:
	docker exec -ti pokepare_db bash

yarn_build:
	cd frontend && yarn build && cd ..

freeze:
	pip freeze > requirements.txt