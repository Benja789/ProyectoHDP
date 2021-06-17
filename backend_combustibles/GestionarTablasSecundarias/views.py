from django.shortcuts import render
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from GestionarTablasSecundarias.models import Zona


# Create your views here.
def getDatos_zonas (request):
    zonas = list(Zona.objects.values())
    return JsonResponse (zonas, safe = False)
