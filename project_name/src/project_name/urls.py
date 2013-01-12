from django.conf.urls import patterns, include, url
from django.contrib import admin
import views


admin.autodiscover()

urlpatterns = patterns(
    '',
    url(r'^$', views.home),
    url(r'^admin/', include(admin.site.urls)),
)
