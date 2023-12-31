

from .models import Cart, MensCloths, MensShoes, MensWatches, WomensGlasses, WomensHandbags, BaseProduct, Whitelist, BaseCartWhiteList, Checkout
from rest_framework import serializers


class BaseProductSerializers(serializers.ModelSerializer):
    class Meta:
        model = BaseProduct
        fields = "__all__"


class MensClothsSerializers(serializers.ModelSerializer):
    class Meta:
        model = MensCloths
        fields = "__all__"


class MensShoesSerializers(serializers.ModelSerializer):
    class Meta:
        model = MensShoes
        fields = "__all__"


class MensWatchesSerializers(serializers.ModelSerializer):
    class Meta:
        model = MensWatches
        fields = "__all__"


class WomensHandbagsSerializers(serializers.ModelSerializer):
    class Meta:
        model = WomensHandbags
        fields = "__all__"


class WomensGlassesSerializers(serializers.ModelSerializer):
    class Meta:
        model = WomensGlasses
        fields = "__all__"


class CartSerializers(serializers.ModelSerializer):
    class Meta:
        model = Cart
        fields = "__all__"


class WhiteListSerializers(serializers.ModelSerializer):
    class Meta:
        model = Whitelist
        fields = "__all__"


class BaseCartWhitelistSerializers(serializers.ModelSerializer):
    class Meta:
        model = BaseCartWhiteList
        fields = "__all__"


class CheckoutSerializers(serializers.ModelSerializer):
    class Meta:
        model = Checkout
        fields = "__all__"
