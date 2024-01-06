from django.shortcuts import render
from .serializers import *
from .models import *
from rest_framework import viewsets
from rest_framework.authentication import SessionAuthentication
from rest_framework.filters import SearchFilter
from rest_framework.permissions import IsAuthenticated
from rest_framework.generics import ListCreateAPIView
from django_filters.rest_framework import DjangoFilterBackend
# Create your views here.


from django.views.decorators.csrf import csrf_exempt


class BaseProductView(ListCreateAPIView):
    queryset = BaseProduct.objects.all()
    serializer_class = BaseProductSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]


class MensClothsView(ListCreateAPIView):
    queryset = MensCloths.objects.all()
    serializer_class = MensClothsSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]


class MensShoesView(ListCreateAPIView):
    queryset = MensShoes.objects.all()
    serializer_class = MensShoesSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]


class MensWatchesView(ListCreateAPIView):
    queryset = MensWatches.objects.all()
    serializer_class = MensWatchesSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]


class WomensHandbagsView(ListCreateAPIView):
    queryset = WomensHandbags.objects.all()
    serializer_class = WomensHandbagsSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]


class WomensGlassesView(ListCreateAPIView):
    queryset = WomensGlasses.objects.all()
    serializer_class = WomensGlassesSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]


class BeseCartWhitelistView(ListCreateAPIView):
    queryset = BaseCartWhiteList.objects.all()
    serializer_class = BaseCartWhitelistSerializers
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    # authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user = self.request.user
        return Whitelist.objects.filter(user=user)


class CartView(ListCreateAPIView):
    queryset = Cart.objects.all()
    serializer_class = CartSerializers
    # filter_backends = [SearchFilter]
    # filterset_fields = ['user']

    def get_queryset(self):
        user_id = self.request.query_params.get('id')
        if user_id:
            return Cart.objects.filter(user=user_id)


class WhiteListView(ListCreateAPIView):
    queryset = Whitelist.objects.all()
    serializer_class = WhiteListSerializers
    # authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user_id = self.request.query_params.get('id')
        if user_id:
            return Whitelist.objects.filter(user=user_id)


class CheckOutView(ListCreateAPIView):
    queryset = Checkout.objects.all()
    serializer_class = CheckoutSerializers
    # authentication_classes = [SessionAuthentication]

    def get_queryset(self):
        user_id = self.request.query_params.get('id')
        if user_id:
            return Checkout.objects.filter(user=user_id)
