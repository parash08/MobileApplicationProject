

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
    product_details = BaseProductSerializers(read_only=True)

    class Meta:
        model = Cart
        fields = ['id', 'user', 'product', 'quantity', 'product_details']

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        product_data = BaseProductSerializers(instance.product).data
        representation['product_details'] = product_data
        return representation


class WhiteListSerializers(serializers.ModelSerializer):
    product_details = BaseProductSerializers(read_only=True)

    class Meta:
        model = Whitelist
        fields = ['id', 'user', 'product', 'quantity', 'product_details']

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        product_data = BaseProductSerializers(instance.product).data
        representation['product_details'] = product_data
        return representation


class BaseCartWhitelistSerializers(serializers.ModelSerializer):
    class Meta:
        model = BaseCartWhiteList
        fields = "__all__"


class CheckoutSerializers(serializers.ModelSerializer):
    product_details = BaseProductSerializers(read_only=True)

    class Meta:
        model = Checkout
        fields = ['id', 'user', 'product', 'first_name', 'last_name', 'email', 'country',
                  'city', 'address', 'mobile_number', 'order_note', 'payment_method', 'total_bill', 'order_status', 'product_details']

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        product_data = BaseProductSerializers(instance.product).data
        representation['product_details'] = product_data
        return representation
