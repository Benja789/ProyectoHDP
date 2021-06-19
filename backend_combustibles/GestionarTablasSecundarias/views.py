from django.shortcuts import render
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from GestionarTablasSecundarias.models import Zona, Periodo
from Prediccion.models import Prediccion


# Create your views here.
def sendData_zonas (request):
    zonas = list(Zona.objects.values())
    prediccion = list(Prediccion.objects.values( 'idperiodo_id','idzona_id', 'idgasolina_id', 'precio', 'variacion').filter(estado='Aplicado').order_by('-idprediccion')[:9])
    #for i in range(3):
     #   for j in range(3):
     #       zonas[i].insert(prediccion[j])

    return JsonResponse (zonas, safe = False)

def sendData_periodo (request):
    periodo =list(Periodo.objects.values())
    return JsonResponse(periodo, safe=False)

def ultimoPeriodo (request):
    periodoVigencia = list(Periodo.objects.values().order_by('-idperiodo')[:1])
    return JsonResponse(periodoVigencia, safe=False)