# -*- coding: utf-8 -*-
import os


PROJ_NAME = '{{ project_name }}'

root = os.path.realpath(os.path.dirname(__file__))
VAR_DIR = os.path.join(root, '..', '..', 'var')

if os.access('/var/log/%s' % PROJ_NAME, os.W_OK):
    LOG_DIR = '/var/log/%s' % PROJ_NAME
else:
    import tempfile
    LOG_DIR = tempfile.gettempdir()

DEBUG = False
TEMPLATE_DEBUG = DEBUG

ALLOWED_HOSTS = ['*']

ADMINS = (
    # ('Your Name', 'your_email@example.com'),
)

MANAGERS = ADMINS

#DATABASES = {
#    'default': {
#        # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
#        'ENGINE': 'django.db.backends.postgresql_psycopg2',
#        'NAME': PROJ_NAME,
#        'USER': PROJ_NAME,
#        'PASSWORD': PROJ_NAME,
#        'HOST': 'localhost',
#        'PORT': '',
#    }
#}

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(VAR_DIR, PROJ_NAME + '.sqlite'),
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': '',
    },
}

SITE_ID = 1

TIME_ZONE = 'Europe/Moscow'
LANGUAGE_CODE = 'ru'
USE_I18N = True
USE_L10N = True
USE_TZ = True

STATIC_ROOT = os.path.join(root, '..', '..', 'web', 'static')
STATIC_URL = '/static/'

MEDIA_ROOT = os.path.join(root, '..', '..', 'web', 'uploads')
MEDIA_URL = '/uploads/'

STATICFILES_DIRS = (
)

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'djangobower.finders.BowerFinder',
)

BOWER_COMPONENTS_ROOT = os.path.join(root, '..', '..')

SECRET_KEY = '{{ secret_key }}'

TEMPLATES = [{
    'BACKEND': 'django.template.backends.django.DjangoTemplates',
    'DIRS': [
        os.path.join(root, 'templates'),
    ],
    'OPTIONS': {
        'loaders': (
            'django.template.loaders.filesystem.Loader',
            'django.template.loaders.app_directories.Loader',
            # 'django.template.loaders.eggs.Loader',
        ),
        'context_processors': (
            'django.contrib.auth.context_processors.auth',
            'django.core.context_processors.debug',
            'django.core.context_processors.i18n',
            'django.core.context_processors.media',
            'django.core.context_processors.static',
            'django.core.context_processors.tz',
            'django.core.context_processors.request',
            'django.contrib.messages.context_processors.messages',
        ),
    }
}, {
    'BACKEND': PROJ_NAME + '.j2.Jinja2Backend',
    'DIRS': [
        os.path.join(root, 'templates', 'jinja2'),
    ],
    'OPTIONS': {
        'extensions': [],
    },
}]

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    # Uncomment the next line for simple clickjacking protection:
    # 'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = PROJ_NAME + '.urls'

WSGI_APPLICATION = PROJ_NAME + '.wsgi.application'

TEMPLATE_DIRS = (
    os.path.join(root, 'templates'),
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin',
    'djangobower',
    PROJ_NAME,
)

BOWER_INSTALLED_APPS = (
    'bootstrap',
)

INTERNAL_IPS = (
    '127.0.0.1',
)


# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}

TEST_RUNNER = 'django.test.runner.DiscoverRunner'

