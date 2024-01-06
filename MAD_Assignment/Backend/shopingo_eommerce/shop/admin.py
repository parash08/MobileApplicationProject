

from django.contrib import admin
from .models import MensCloths, MensShoes, MensWatches, WomensGlasses, WomensHandbags, BaseProduct, Cart, Whitelist, BaseCartWhiteList, Checkout
# Register your models here.


@admin.register(MensCloths, MensWatches, MensShoes, WomensHandbags, WomensGlasses, BaseProduct)
class MensClothsAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class BaseProductAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class MensShoesAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class MensWatchesAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class WomensHandbagsAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


class WomensGlassesAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'price', 'image', 'description']


@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'product', 'quantity']


@admin.register(Whitelist)
class WhitelistAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'product', 'quantity']


@admin.register(BaseCartWhiteList)
class BaseCartWhiteListAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'product', 'quantity']


@admin.register(Checkout)
class CheckoutAdmin(admin.ModelAdmin):
    list_display = ['user', 'product', 'first_name', 'last_name', 'email', 'country', 'city',
                    'address', 'mobile_number', 'order_note', 'payment_method', 'total_bill', 'order_status']
