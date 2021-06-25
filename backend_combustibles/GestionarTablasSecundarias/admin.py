from django.contrib import admin
from GestionarTablasSecundarias.models import *

class Class_Admin_Periodo(admin.ModelAdmin):
    list_display=("idperiodo", "fechainicio","fechafin")
    search_fields=("idperiodo", "fechainicio","fechafin")
# Register your models here.

class Class_Admin_Gasolina(admin.ModelAdmin):
    list_display=("idgasolina", "tipogasolina")
    search_fields=("idgasolina", "tipogasolina")

class Class_Admin_Zona(admin.ModelAdmin):
    list_display=("idzona", "nombrezona")
    search_fields=("idzona", "nombrezona")


admin.site.register(Gasolina, Class_Admin_Gasolina)
admin.site.register(Zona, Class_Admin_Zona)
admin.site.register(Periodo, Class_Admin_Periodo)