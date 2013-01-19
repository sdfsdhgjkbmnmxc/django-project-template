from settings import *  # @UnusedWildImport  # NOQA


ADMINS = ()
DEBUG = True
TEMPLATE_DEBUG = DEBUG
ROOT_URLCONF = '{{ project_name }}.localurls'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(VAR_DIR, '{{ project_name }}.sqlite'),
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': '',
    },
}
