from django.conf import settings


def goodies(request):
    return {
        'STATIC_URL': settings.STATIC_URL,
        'BUILT_URL': settings.BUILT_URL,
        'DEBUG': settings.DEBUG}
