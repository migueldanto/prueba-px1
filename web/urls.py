from django.urls import path,include
from .views import home,about

urlpatterns = [
    path("",home),
    path("about",about)
]