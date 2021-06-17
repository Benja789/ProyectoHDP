from django.shortcuts import render
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from GestionarTablasSecundarias.models import Zona, Periodo


# Create your views here.
def sendData_zonas (request):
    zonas = list(Zona.objects.values())
    return JsonResponse (zonas, safe = False)

def sendData_periodo (request):
    periodo =list(Periodo.objects.values())
    return JsonResponse(periodo, safe=False)