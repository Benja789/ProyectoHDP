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
from django.contrib import admin
from django.urls import path
from django.views.generic import TemplateView
from Prediccion.views import sendData_Historial
from GestionarTablasSecundarias.views import sendData_periodo, sendData_zonas

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', TemplateView.as_view(template_name="index.html")), #Cargador
    path('inicio', TemplateView.as_view(template_name="index.html")), #Inicio o pagina principal
    path('login/', TemplateView.as_view(template_name="index.html")), #Inicio de sesion de usuario
    path('usuario/', TemplateView.as_view(template_name="index.html")), #Vista del usuario
    path('jsonhistorial', sendData_Historial), #Historial de los precios aplicados de la pagina inicio
    path('jsonpreciosvigentes', sendData_zonas), #Datos de la pagina del inicio
    path('jsonperiodo', sendData_periodo),
    #path('jsonultimoperiodo', ultimoPeriodo),
    #path('jsonvigentes',preciosVigentes),

]
