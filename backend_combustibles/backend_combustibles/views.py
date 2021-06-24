from django.shortcuts import render
from django.http.response import HttpResponse


def vista_cargador (request):
    return render(request, 'index.html')

def vista_inicio (request):
    return render (request, 'index.html')