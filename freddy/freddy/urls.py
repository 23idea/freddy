from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView
from django.conf import settings
from freddy import views
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'freddy.views.home', name='home'),
    # url(r'^freddy/', include('freddy.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    #url(r'^$', TemplateView.as_view(template_name='index.jade'), name="jade"),
    url(r'^$', views.indexView.as_view(), name='event'),
    url(r'^admin/', include(admin.site.urls)),
    # url(r'^admin/', include(admin.site.urls)),
    url(r'^photologue/', include('photologue.urls'))
)

if settings.DEBUG:
    # static files (images, css, javascript, etc.)
    urlpatterns += patterns('',
        (r'^media/(?P<path>.*)$', 'django.views.static.serve', {
        'document_root': settings.MEDIA_ROOT}))
