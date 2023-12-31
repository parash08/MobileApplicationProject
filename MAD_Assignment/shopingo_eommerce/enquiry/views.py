from django.shortcuts import render
from .models import Enquiry
from .serializers import EnquirySerializer
from rest_framework.generics import ListAPIView
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticatedOrReadOnly

# Create your views here.


class EnquiryView(ListAPIView):
    queryset = Enquiry.objects.all()
    serializer_class = EnquirySerializer
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticatedOrReadOnly]
