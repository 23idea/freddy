from django.template import RequestContext
from django.shortcuts import render_to_response
from django.views.generic.base import View
from photologue.models import Gallery
import json


class indexView(View):
    def get(self, request, **kwargs):
        galleries = Gallery.objects.filter(is_public=True)
        gallery_data = []
        for gallery in galleries:
            image_data = []
            for image in gallery.public():
                image_data.append({
                    'big': image.get_display_url(),
                    'thumb': image.get_thumbnail_url(),
                    'image': image.get_absolute_url(),
                    'description': image.caption,
                    'title': image.title
                })
            gallery_data.append(image_data)

        json_data = json.dumps(gallery_data)
        return render_to_response(
            'index.jade',
            {
                'object_list': galleries,
                'gallery_data': json_data
            },
            context_instance=RequestContext(request)
        )
