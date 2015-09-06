# -*- coding: utf-8 -*-
import sys

from django.template import TemplateDoesNotExist, TemplateSyntaxError
from django.template.backends.jinja2 import Jinja2, Template as J2Template
from jinja2 import Environment
import jinja2
import six

from .j2_config import J2Config


j2_config = J2Config()


def environment(**options):
    env = Environment(**options)
    env.filters.update(j2_config.filters())
    env.globals.update(j2_config.tags())
    env.globals.update(j2_config.page_constants())
    return env


class Jinja2Backend(Jinja2):
    def __init__(self, params):
        params.setdefault('OPTIONS', {}).setdefault(
            'environment',
            environment.__module__ + '.' + environment.__name__,
        )
        super(Jinja2Backend, self).__init__(params)

    def get_template(self, template_name):
        try:
            return Template(self.env.get_template(template_name))
        except jinja2.TemplateNotFound as exc:
            six.reraise(TemplateDoesNotExist, TemplateDoesNotExist(exc.args),
                        sys.exc_info()[2])
        except jinja2.TemplateSyntaxError as exc:
            six.reraise(TemplateSyntaxError, TemplateSyntaxError(exc.args),
                        sys.exc_info()[2])


class Template(J2Template):
    def __init__(self, template):
        self.template = template

    def render(self, context=None, request=None):
        if context is None:
            context = {}
        if request is not None:
            context.update(j2_config.page_vars(request))
        return self.template.render(context)
