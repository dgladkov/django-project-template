import os
import django.core.handlers.wsgi


os.environ['DJANGO_SETTINGS_MODULE'] = 'project.settings.staging'

application = django.core.handlers.wsgi.WSGIHandler()
