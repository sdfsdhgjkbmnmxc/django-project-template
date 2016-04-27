import os

from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.static import serve

from {{ project_name }}.urls import *  # @UnusedWildImport  # NOQA


mediaurls = [
    url(r'^%s(?P<path>.*)$' % 'uploads/', serve,
        {'document_root': os.path.join(settings.MEDIA_ROOT, '../uploads/')}),
    url(r'^(?P<path>favicon.ico|robots.txt)$', serve,
        {'document_root': os.path.join(settings.MEDIA_ROOT, '..')}),
]

urlpatterns = mediaurls + staticfiles_urlpatterns() + urlpatterns
