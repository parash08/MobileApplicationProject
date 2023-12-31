from django.shortcuts import render
from .serializers import *
from .models import *
from rest_framework import viewsets
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated
# Create your views here.


class BaseProductView(viewsets.ModelViewSet):
    queryset = BaseProduct.objects.all()
    serializer_class = BaseProductSerializers
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]


class MensClothsView(viewsets.ModelViewSet):
    queryset = MensCloths.objects.all()
    serializer_class = MensClothsSerializers
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]


class MensShoesView(viewsets.ModelViewSet):
    queryset = MensShoes.objects.all()
    serializer_class = MensShoesSerializers
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]


class MensWatchesView(viewsets.ModelViewSet):
    queryset = MensWatches.objects.all()
    serializer_class = MensWatchesSerializers
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]


class WomensHandbagsView(viewsets.ModelViewSet):
    queryset = WomensHandbags.objects.all()
    serializer_class = WomensHandbagsSerializers
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]


class WomensGlassesView(viewsets.ModelViewSet):
    queryset = WomensGlasses.objects.all()
    serializer_class = WomensGlassesSerializers
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]


class BeseCartWhitelistView(viewsets.ModelViewSet):
    queryset = BaseCartWhiteList.objects.all()
    serializer_class = BaseCartWhitelistSerializers
    authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user = self.request.user
        return Whitelist.objects.filter(user=user)


class CartView(viewsets.ModelViewSet):
    queryset = Cart.objects.all()
    serializer_class = CartSerializers
    authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user = self.request.user
        return Cart.objects.filter(user=user)


class WhiteListView(viewsets.ModelViewSet):
    queryset = Whitelist.objects.all()
    serializer_class = WhiteListSerializers
    authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user = self.request.user
        return Whitelist.objects.filter(user=user)


class CheckOutView(viewsets.ModelViewSet):
    queryset = Checkout.objects.all()
    serializer_class = CheckoutSerializers
    authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user = self.request.user
        return Checkout.objects.filter(user=user)
