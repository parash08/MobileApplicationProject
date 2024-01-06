
from django.urls import include, path
from shop import views
from rest_framework.routers import DefaultRouter
# router = DefaultRouter()
# router.register('product', views.BaseProductView, basename='product')
# router.register('cloths', views.MensClothsView, basename="cloths")
# router.register('shoes', views.MensShoesView, basename="shoes")
# router.register('watches', views.MensWatchesView, basename="wathces")
# router.register('handbags', views.WomensHandbagsView, basename="handbags")
# router.register('glasses', views.WomensGlassesView, basename="glasses")
# # router.register(r'cart', views.CartView, basename='cart')
# router.register('whitelist', views.WhiteListView, basename='whitelist')
# router.register('basecartwhitelist', views.BeseCartWhitelistView,
#                 basename='basecartwhitelist')
# router.register('checkout', views.CheckOutView, basename='checkout')
urlpatterns = [
    # path('shop/', include(router.urls)),
    path('shop/product/', views.BaseProductView.as_view()),
    path('shop/cloths/', views.MensClothsView.as_view()),
    path('shop/shoes/', views.MensShoesView.as_view()),
    path('shop/watches/', views.MensWatchesView.as_view()),
    path('shop/handbags/', views.WomensHandbagsView.as_view()),
    path('shop/glasses/', views.WomensGlassesView.as_view()),
    path('shop/cart/', views.CartView.as_view()),
    path('shop/whitelist/', views.WhiteListView.as_view()),
    path('shop/basecartwhitelist/', views.BeseCartWhitelistView.as_view()),
    path('shop/checkout/', views.CheckOutView.as_view())


]
