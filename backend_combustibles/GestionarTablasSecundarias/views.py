from django.shortcuts import render
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from GestionarTablasSecundarias.models import Zona, Periodo
from Prediccion.models import Prediccion


# Create your views here.
def sendData_zonas (request):
    #Metodo que manda a traer los de los combustibles vigentes que se muestran al inicio
    zonas = list(Zona.objects.values())
    prediccion = list(Prediccion.objects.values(
        'idperiodo_id',
        'idzona_id',
        'idgasolina_id',
        'precio',
        'variacion').filter(estado='Aplicado').order_by('-idprediccion')[:9])
    periodo = list(Periodo.objects.values('fechainicio','fechafin').order_by('-idperiodo')[:1])
    datosEnviados=[]

    #Arreglo del diccionario para mandaro como respuesta a una peticion de Ajax
    for i in range(3):
        diccionario = {
            "idzona":"",
            "nombrezona":"",
            "idperiodo": "",
            "inicio":"",
            "fin":"",
            "especial":"",
            "regular":"",
            "diesel":"",
            "variacion_e":"",
            "variacion_r":"",
            "variacion_d":""}

        diccionario["idzona"]=zonas[i]["idzona"]
        diccionario["nombrezona"]=zonas[i]["nombrezona"]
        diccionario["idperiodo"]= prediccion[i]["idperiodo_id"]
        diccionario["inicio"]= periodo[0]["fechainicio"].strftime("%Y/%m/%d")
        diccionario["fin"]= periodo[0]["fechafin"].strftime("%Y/%m/%d")

        for j in range(len(prediccion)):
            if prediccion[j]["idzona_id"]==diccionario["idzona"]:
                if prediccion[j]["idgasolina_id"]=="ES01":
                    diccionario["especial"]= prediccion[j]["precio"]
                    diccionario["variacion_e"]=prediccion[j]["variacion"]

                if prediccion[j]["idgasolina_id"]=="RE02":
                    diccionario["regular"]= prediccion[j]["precio"]
                    diccionario["variacion_r"]=prediccion[j]["variacion"]

                if prediccion[j]["idgasolina_id"] =="DI03":
                    diccionario["diesel"]= prediccion[j]["precio"]
                    diccionario["variacion_d"]=prediccion[j]["variacion"]

        datosEnviados.append(diccionario)
        del(diccionario)
    return JsonResponse (datosEnviados, safe = False)

def sendData_periodo (request):
    #Metodo que envia diccionario del periodo
    periodo =list(Periodo.objects.values().order_by('-idperiodo'))
    periodoEnviado = []
    meses =[
        "enero",
        "febrero",
        "marzo",
        "abril",
        "mayo",
        "junio",
        "julio",
        "agosto",
        "septiembre",
        "octubre",
        "noviembre","diciembre"]
    
    for i in range(len(periodo)):
        diccionario ={
            "idperiodo":"",
            "fechainicio":"",
            "fechafin":""
        }
        diccionario ["idperiodo"] = periodo[i]["idperiodo"]
        diccionario ["fechainicio"] = periodo[i]["fechainicio"].strftime("%Y/%m/%d")
        diccionario ["fechafin"] = periodo[i]["fechafin"].strftime("%Y/%m/%d")
        
        periodoEnviado.append(diccionario)
        del(diccionario)
    
    return JsonResponse(periodoEnviado, safe=False)
