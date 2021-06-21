from django.db.models.query import FlatValuesListIterable
from django.shortcuts import render
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from Prediccion.models import Prediccion
from GestionarTablasSecundarias.models import Periodo
from django.views.decorators.csrf import csrf_exempt

# Create your views here.
@csrf_exempt
def sendData_Historial (request):
    #Metodo que muestra manda un Json del historial de los precios aplicados
    if request.method =='GET':
        #Si el metodo es un get manda los ultimos cambios
        historial = list(Prediccion.objects.filter(estado='Aplicado').values(
            "idprediccion",
            "idperiodo_id",
            "idzona_id",
            "idgasolina_id",
            "precio",
            "variacion"
        ).order_by('-idprediccion')[:36])
        periodo = list(Periodo.objects.values().order_by('-idperiodo')[:4])
        datosEnviados =[]

        for i in range(len(historial)):
            diccionario ={
                "idprediccion": "",
                "idperiodo_id":"",
                "fechainicio":"",
                "fechafin":"",
                "idzona_id": "",
                "idgasolina_id": "",
                "precio": "",
                "variacion": ""
            }
            diccionario["idprediccion"] = historial[i]["idprediccion"]
            diccionario["idperiodo_id"] = historial[i]["idperiodo_id"]
            diccionario["idzona_id"] = historial[i]["idzona_id"]
            diccionario["idgasolina_id"] = historial[i]["idgasolina_id"]
            diccionario["precio"]= historial[i]["precio"]
            diccionario["variacion"]=historial[i]["variacion"]
            for j in range(len(periodo)):
                if periodo[j]["idperiodo"] == diccionario["idperiodo_id"]:
                    diccionario["fechainicio"] =periodo[j]["fechainicio"].strftime("%Y/%m/%d")
                    diccionario["fechafin"] =periodo[j]["fechafin"].strftime("%Y/%m/%d")
            datosEnviados.append(diccionario)
            del(diccionario)
        del(historial, periodo)
        return JsonResponse(datosEnviados, safe=False)

    elif request.method == 'POST':
        #Si el metodo es un post, manda el periodo seleccionado
        historial = list(Prediccion.objects.filter(estado='Aplicado', idperiodo_id=request.POST['idperiodo']).values(
            "idprediccion",
            "idperiodo_id",
            "idzona_id",
            "idgasolina_id",
            "precio",
            "variacion"
        ).order_by('-idprediccion'))    
        periodo = list(Periodo.objects.filter(idperiodo=request.POST['idperiodo']).values())       
        respuesta = []
        for i in range(len(historial)):
            diccionario ={
                "idprediccion": "",
                "idperiodo_id":"",
                "fechainicio":"",
                "fechafin":"",
                "idzona_id": "",
                "idgasolina_id": "",
                "precio": "",
                "variacion": ""
            }
            diccionario["idprediccion"] = historial[i]["idprediccion"]
            diccionario["idperiodo_id"] = historial[i]["idperiodo_id"]
            diccionario["idzona_id"] = historial[i]["idzona_id"]
            diccionario["idgasolina_id"] = historial[i]["idgasolina_id"]
            diccionario["precio"]= historial[i]["precio"]
            diccionario["variacion"]=historial[i]["variacion"]
            for j in range(len(periodo)):
                if periodo[j]["idperiodo"] == diccionario["idperiodo_id"]:
                    diccionario["fechainicio"] =periodo[j]["fechainicio"].strftime("%Y/%m/%d")
                    diccionario["fechafin"] =periodo[j]["fechafin"].strftime("%Y/%m/%d")
            respuesta.append(diccionario)
            del(diccionario)
        del(historial, periodo)

        return JsonResponse (respuesta, safe=False)


