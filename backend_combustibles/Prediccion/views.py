from django.db.models.expressions import F
from django.db.models.query_utils import Q
from django.db.models.query import FlatValuesListIterable
from django.shortcuts import render
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from Prediccion.models import Prediccion
from GestionarTablasSecundarias.models import Periodo
from Prediccion.calculo_combustible import generacion_modelo
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
        historial = list(Prediccion.objects.filter(Q(estado='Aplicado') & Q(idperiodo_id=request.POST['idperiodo'])).values(
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

def grafica_central (request):
    #Manda los datos de para la grafica de zona central
    datos =list(Prediccion.objects.filter(Q(idzona_id="ZCEN")& Q(estado="Aplicado")).values("idperiodo_id", "idgasolina_id", "precio"))
    periodo = list(Periodo.objects.values('idperiodo'))
    respuesta =[]
    for i in range(len(periodo)+1):
        if i != 0:
            diccionario ={
                "idperiodo":i,
                "Especial":0,
                "Regular":0,
                "Diesel":0
            }
            for j in range(len(datos)):
                if datos[j]["idperiodo_id"] == i:
                    if datos[j]["idgasolina_id"] == "ES01":
                        diccionario["Especial"] = datos[j]["precio"]
                    elif datos[j]["idgasolina_id"] == "RE02":
                        diccionario["Regular"] = datos[j]["precio"]
                    elif datos[j]["idgasolina_id"] == "DI03":
                        diccionario["Diesel"] = datos[j]["precio"]
            respuesta.append(diccionario)
            del(diccionario)
    
    return JsonResponse(respuesta, safe=False)


def grafica_occidental (request):
    #Manda los datos de para la grafica de zona central
    datos =list(Prediccion.objects.filter(Q(idzona_id="ZOCC")& Q(estado="Aplicado")).values("idperiodo_id", "idgasolina_id", "precio"))
    periodo = list(Periodo.objects.values('idperiodo'))
    respuesta =[]
    for i in range(len(periodo)+1):
        if i != 0:
            diccionario ={
                "idperiodo":i,
                "Especial":0,
                "Regular":0,
                "Diesel":0
            }
            for j in range(len(datos)):
                if datos[j]["idperiodo_id"] == i:
                    if datos[j]["idgasolina_id"] == "ES01":
                        diccionario["Especial"] = datos[j]["precio"]
                    elif datos[j]["idgasolina_id"] == "RE02":
                        diccionario["Regular"] = datos[j]["precio"]
                    elif datos[j]["idgasolina_id"] == "DI03":
                        diccionario["Diesel"] = datos[j]["precio"]
            respuesta.append(diccionario)
            del(diccionario)
    
    return JsonResponse(respuesta, safe=False)


def grafica_oriental (request):
    #Manda los datos de para la grafica de zona central
    datos =list(Prediccion.objects.filter(Q(idzona_id="ZORI")& Q(estado="Aplicado")).values("idperiodo_id", "idgasolina_id", "precio"))
    periodo = list(Periodo.objects.values('idperiodo'))
    respuesta =[]
    for i in range(len(periodo)+1):
        if i != 0:
            diccionario ={
                "idperiodo":i,
                "Especial":0,
                "Regular":0,
                "Diesel":0
            }
            for j in range(len(datos)):
                if datos[j]["idperiodo_id"] == i:
                    if datos[j]["idgasolina_id"] == "ES01":
                        diccionario["Especial"] = datos[j]["precio"]
                    elif datos[j]["idgasolina_id"] == "RE02":
                        diccionario["Regular"] = datos[j]["precio"]
                    elif datos[j]["idgasolina_id"] == "DI03":
                        diccionario["Diesel"] = datos[j]["precio"]
            respuesta.append(diccionario)
            del(diccionario)
    
    return JsonResponse(respuesta, safe=False)

@csrf_exempt
def generar_modelo(request):
    dui =request.POST['dui']
    zona =request.POST['zona']
    datos= [
        float(request.POST['butano']),#0
        float(request.POST['fob']),#1
        float(request.POST['marino']),#2
        float(request.POST['mayorista']),#3
        float(request.POST['unl87']),#4
        float(request.POST['unl93']),#5
        float(request.POST['minorista'])#6
        ]
    butano =float(request.POST['butano'])
    fob=float(request.POST['fob'])#1
    flete_m= float(request.POST['marino'])
    m_mayorista= float(request.POST['mayorista'])#3
    m_minorista=float(request.POST['minorista'])#6
    u87= float(request.POST['unl87'])
    u93=float(request.POST['unl93'])

    estado="Modelo almacenado"

    for i in range(len(datos)):
        if datos[i]<=0:
            return JsonResponse({"resultado":"Los datos deben de ser positivos"})
    
    almacen=generacion_modelo(
        zona,
        fob,
        u87,
        u93,
        butano,
        flete_m,
        m_mayorista,
        m_minorista
    )
    print(almacen)

    return JsonResponse({"resultado":"Modelo generado y almacenado"})