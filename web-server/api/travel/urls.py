from django.urls import path,include
from api.travel.travelviews import *
from rest_framework.routers import DefaultRouter
router = DefaultRouter()
router.register(r'travel',TravelViewSet)
urlpatterns = [
    path('similar/<str:id>/', SimilarTravelList.as_view()),
]
urlpatterns += router.urls