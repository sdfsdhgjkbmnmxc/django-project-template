# -*- coding: utf-8 -*-
from django.template.backends.utils import csrf_input_lazy, csrf_token_lazy
from django.conf import settings
from django.contrib.staticfiles.storage import staticfiles_storage
from django.core.urlresolvers import reverse
from django.template.defaultfilters import date, linebreaksbr
from django.utils.html import linebreaks


class J2Config(object):
    def tags(self):
        return {
            'static': staticfiles_storage.url,
            'url': reverse,
        }

    def filters(self):
        return {
            'date': date,
            'linebreaks': linebreaks,
            'linebreaksbr': linebreaksbr,
        }

    def page_vars(self, request):
        return {
            'request': request,
            'csrf_input': csrf_input_lazy(request),
            'csrf_token': csrf_token_lazy(request),
        }

    def page_constants(self):
        return {
            'DEBUG': settings.DEBUG,
        }
