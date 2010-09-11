# Simple Makefile for Django project routines

project=project
processes=4
user=www-data # owner of the socket, normally should be nginx user
instance=production # application instance

clean:
	-rm -rf build
	-rm -rf *~*
	-find . -name '*.pyc' -exec rm {} \;

test: clean
	python $(project)/manage.py test

pep8:
	pep8.py --filename=*.py --ignore=W --exclude="manage.py,settings.py" --statistics --repeat $(project) 

pylint:
	pylint $(project)  --max-public-methods=50 --include-ids=y --ignored-classes=Item.Meta --method-rgx='[a-z_][a-z0-9_]{2,40}$$'

fresh_syncdb:
	-rm -f $(project).sqlite
	python $(project)/manage.py syncdb --noinput

syncdb:
	python $(project)/manage.py syncdb --noinput

shell:
	python $(project)/manage.py shell

run:
	python $(project)/manage.py runserver 0.0.0.0:8000

uwsgi:
	uwsgi -p $(processes) -s /tmp/$(project).sock -H ./env --uid $(user) -w $(project).wsgi.$(instance) --pythonpath ./$(project)
