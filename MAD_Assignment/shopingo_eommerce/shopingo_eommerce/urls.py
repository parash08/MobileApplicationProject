
from django.contrib import admin
from django.urls import path, include

from shopingo_eommerce import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('account.urls')),
    path('api/', include('aboutus.urls')),
    path('api/', include('enquiry.urls')),
    path('api/', include('refundPolicy.urls')),
    path('api/', include('termsConditions.urls')),
    path('api/', include('shop.urls')),

    path('auth/', include('rest_framework.urls', namespace='rest_framework'))
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
