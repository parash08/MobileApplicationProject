
from django.urls import include, path
from shop import views
from rest_framework.routers import DefaultRouter
router = DefaultRouter()
router.register('product', views.BaseProductView, basename='product')
router.register('cloths', views.MensClothsView, basename="cloths")
router.register('shoes', views.MensShoesView, basename="shoes")
router.register('watches', views.MensWatchesView, basename="wathces")
router.register('handbags', views.WomensHandbagsView, basename="handbags")
router.register('glasses', views.WomensGlassesView, basename="glasses")
router.register('cart', views.CartView, basename='cart')
router.register('whitelist', views.WhiteListView, basename='whitelist')
router.register('basecartwhitelist', views.BeseCartWhitelistView,
                basename='basecartwhitelist')
router.register('checkout', views.CheckOutView, basename='checkout')
urlpatterns = [
    path('shop/', include(router.urls)),
    
]
