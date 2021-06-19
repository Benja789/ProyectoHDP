from django.db.models.query import FlatValuesListIterable
from django.shortcuts import render
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from Prediccion.models import Prediccion

# Create your views here.
def getDatos_Prediccion (request):

    prediccion = list(Prediccion.objects.values().filter(estado='Aplicado').order_by('-idprediccion')[:36])
    
    return JsonResponse(prediccion, safe=False)


def preciosVigentes (request):
    vigentes = list(Prediccion.objects.values( "idzona","idgasolina", "precio", "variacion").filter(estado='Aplicado').order_by('-idprediccion')[:9])
    return JsonResponse(vigentes, safe=False)