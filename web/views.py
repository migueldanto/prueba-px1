from django.shortcuts import render

# Create your views here.

def home(request):
    return render(request, "web/index.html", {"title": "Home"})

def about(request):
    return render(request, "web/index.html", {"title": "about"})