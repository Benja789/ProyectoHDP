"""backend_combustibles URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Hteome
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import json
from django.contrib import admin
from django.urls import path
from django.views.generic import TemplateView
from backend_combustibles.views import vista_cargador, vista_inicio
from Prediccion.views import sendData_Historial, grafica_central, grafica_occidental, grafica_oriental
from GestionarTablasSecundarias.views import sendData_periodo, sendData_zonas
from GestionUsuario.views import *

urlpatterns = [
    #Vistas
    path('admin/', admin.site.urls),
    path('', vista_cargador), #Cargador
    path('inicio/', vista_inicio), #Inicio o pagina principal
    path('login/', vista_login), #Inicio de sesion de usuario
    path('usuario/', vista_usuario), #Vista del usuario
    path('registrarse/', vista_registrarse),  #Vista para registrarse

    #peticiones inicio
    path('jsonhistorial', sendData_Historial), #Historial de los precios aplicados de la pagina inicio
    path('jsonpreciosvigentes', sendData_zonas), #Datos de la pagina del inicio
    path('jsongraficacentral',grafica_central), #Manda los datos de la grafica central
    path('jsongraficaoccidental', grafica_occidental),#Manda los datoas para la grafica de la zona occidental
    path('jsongraficaoriental', grafica_oriental),#Manda los datoas para la grafica de la zona oriental
    path('jsonperiodo', sendData_periodo), #Devuelve todos los periodos vigentes

    #Peticiones registrarse
    path('jsonregistrarse',registrarse ), #URL para registrarse 
    
    #Peticiones iniciar sesion
    path('jsoniniciarsesion', iniciarSesion), #Metodo encargado para validar la sesion

    #peticiones usuario
    path('consulta', consultarSesion),
    path('jsoncerrarsesion', cerrarSesion),
    path('ultimoscalculos', ultimosCalculos),
    path('historialusuario', historialUsuario),

]
