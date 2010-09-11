from settings.common import *


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': rel('..', '..', 'project.sqlite'),
    }
}

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
