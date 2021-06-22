from django.db import reset_queries
from django.db.models.expressions import F
from django.db.models.query_utils import Q
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from GestionUsuario.models import Usuario

# Create your views here.
@csrf_exempt
def iniciarSesion (request):
    comprobarValidarse = {
        "idUsuario":"",
        "validarse": False,
        "correo": False,
        "password": False
    }
    if request.method =='POST':
        if request.POST['usuario'] != 'undefined' and request.POST['password']!= 'undefined':
            email = request.POST['usuario']
            password = request.POST['password']
            user = list(Usuario.objects.filter(
                Q(correo=email) & Q(password=password)).values(
                    'dui',
                    'nombres',
                    'apellidos',
                    'correo'))
            if len(user)>0:
                request.session['idUsuario'] = user[0]['dui']
                comprobarValidarse['idUsuario'] =user[0]['dui']
                comprobarValidarse['validarse'] =True
                comprobarValidarse['correo'] =True
                comprobarValidarse['password'] =True
            if len(user) ==0:
                if len(list(Usuario.objects.filter(correo=email).values())) >0:
                    comprobarValidarse['correo'] =True
                    if  len(list(Usuario.objects.filter(password=password).values()))>0:
                        comprobarValidarse['password'] =True             
                            
    return JsonResponse(comprobarValidarse, safe=False)
