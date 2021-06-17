from django.shortcuts import render
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from Prediccion.models import Prediccion

# Create your views here.
def getDatos_Prediccion (request):

    prediccion = list(Prediccion.objects.values().order_by('-idprediccion')[:36])
    
    return JsonResponse(prediccion, safe=False)