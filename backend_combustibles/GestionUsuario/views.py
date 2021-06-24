from django.http.response import HttpResponse
from django.shortcuts import render
from django.db.models.expressions import F
from django.db.models.query_utils import Q
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from GestionUsuario.models import Usuario
from django.conf import settings
from Prediccion.models import Prediccion
from GestionarTablasSecundarias.models import Gasolina, Periodo, Zona
import bcrypt

# Create your views here.
@csrf_exempt
def iniciarSesion (request):
    #Metodo que valida que el usuario pueda logearse
    comprobarValidarse = {
        "idUsuario":0,
        "validarse": False,
        "correo": False,
        "password": False,
        "primera":1 }
    if request.method=='GET':
        if ("dui" in request.session):
            return JsonResponse ({"idUsuaro": request.session['dui']})
        return JsonResponse({"idUsuario": 0})
           
    if request.method =='POST':
        if request.POST['email'] != 'undefined' and request.POST['password']!= 'undefined':
            email = request.POST['email']
            password = request.POST["password"]
            user = list(Usuario.objects.filter(Q(correo=email) & Q(password=password)).values(
                    'dui',
                    'nombres',
                    'apellidos',
                    'password',
                    'correo'))
            #print(user[0]['password'])
            if (len(user)>0):
            #if user is not None and bcrypt.checkpw(password.encode('utf-8'), user[0]['password'].encode('utf-8')):
                #print("Segundo if")
                #request.session['dui'] = user[0]['dui']
                comprobarValidarse['idUsuario'] =user[0]['dui']
                #request.session.get('dui',user[0]['dui'])
                #print(request.session.get('dui'))
                request.session['dui'] =comprobarValidarse['idUsuario']
                request.session.modified = True
                #request.session.save
                comprobarValidarse['validarse'] =True
                comprobarValidarse['correo'] =True
                comprobarValidarse['password'] =True
                
                
            if len(user) ==0:
                print("Tercer if")
                if len(list(Usuario.objects.filter(correo=email).values())) >0:
                    comprobarValidarse['correo'] =True
                    if  len(list(Usuario.objects.filter(password=password).values()))>0:
                        comprobarValidarse['password'] =True             
                            
    return JsonResponse(comprobarValidarse)

@csrf_exempt
def cerrarSesion (request):
    #print(request.session["dui"])
    del request.session
    return JsonResponse({"Cerrada": True})

@csrf_exempt 
def consultarSesion (request):
    id =request.POST['dui']
    informacionUsario =list(Usuario.objects.filter(dui=id).values('dui', 'nombres','apellidos'))
    return JsonResponse(informacionUsario, safe=False)


@csrf_exempt
def registrarse(request):
    usarios = list(Usuario.objects.filter(Q(dui=request.POST['dui']) | Q(correo=request.POST['email'])).values('dui'))

    if len(usarios)==0:
        #del (usarios)
        dui = request.POST['dui']
        nombre =request.POST['nombre']
        apellido=request.POST['apellido']
        departamento=request.POST['departamento']
        municipio= request.POST['municipio']
        email=request.POST['email']
        password =request.POST['password']
        fecha=request.POST['fecha']

        pEncryptada = bcrypt.hashpw(
            str(password).encode('utf-8'), bcrypt.gensalt())
        #print(pEncryptada)
        nuevoUsuario = Usuario.objects.create(
            dui =dui,
            nombres=nombre,
            apellidos=apellido,
            departamento=departamento,
            municipio=municipio,
            correo =email,
            password = password,
            fecha_nacimiento= fecha
        )
        try:
            nuevoUsuario.save()
            del nuevoUsuario;
        except:
            return JsonResponse({"Creado":False})

        return JsonResponse({"Creado":True})
    return JsonResponse({"Creado":False})


@csrf_exempt
def ultimosCalculos (request):
    id =request.POST['dui']
    periodoUsuario = list(Prediccion.objects.filter(dui=id).values())
    if len(periodoUsuario)>0:
        del periodoUsuario
        zonas = list(Zona.objects.values())
        prediccion = list(Prediccion.objects.values(
            'idperiodo_id',
            'idzona_id',
            'idgasolina_id',
            'precio',
            'variacion').filter(dui=id).order_by('-idprediccion')[:9])
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
                "variacion_d":"",
                "descripcion":True}

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
    return JsonResponse({"descripcion": False})

@csrf_exempt
def historialUsuario (request):
    id =request.POST['dui']
    historial = list(Prediccion.objects.filter(dui=id).values(
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


def vista_registrarse(request):
    return render(request, 'index.html')

def vista_login(request):
    return render(request, 'index.html')

def vista_usuario(request):
    return render (request, 'index.html')

