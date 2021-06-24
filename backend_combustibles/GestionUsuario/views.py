from django.http.response import HttpResponse
from django.shortcuts import render
from django.db.models.expressions import F
from django.db.models.query_utils import Q
from django.http import JsonResponse, request
from django.views.decorators.csrf import csrf_exempt
from GestionUsuario.models import Usuario

sesion={
    'dui':''
}

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
        print(request.session.get('dui'))
        if ('dui' in request.session):
            return JsonResponse ({"idUsuaro": request.session['dui']})
        return JsonResponse({"idUsuario": 0})
           
    #if request.method =='POST':
    if request.POST['usuario'] != 'undefined' and request.POST['password']!= 'undefined':
        email = request.POST['usuario']
        password = request.POST['password']
        user = list(Usuario.objects.filter(
            Q(correo=email) & Q(password=password)).values(
                'dui',
                'nombres',
                'apellidos',
                'correo'))
        if (len(user)>0):
            request.session['dui'] = user[0]['dui']
            comprobarValidarse['idUsuario'] =user[0]['dui']
            comprobarValidarse['validarse'] =True
            comprobarValidarse['correo'] =True
            comprobarValidarse['password'] =True
            
            
        if len(user) ==0:
            if len(list(Usuario.objects.filter(correo=email).values())) >0:
                comprobarValidarse['correo'] =True
                if  len(list(Usuario.objects.filter(password=password).values()))>0:
                    comprobarValidarse['password'] =True             
                        
    return JsonResponse(comprobarValidarse)

@csrf_exempt
def jsonregistrarse(request):
    pass

def vista_registrarse(request):
    return render(request, 'index.html')

def vista_login(request):
    return render(request, 'index.html')

def vista_usuario(request):
    return render (request, 'index.html')

