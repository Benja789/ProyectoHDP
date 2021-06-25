from django.contrib import admin
from GestionUsuario.models import *

# Register your models here.
class Class_Admin_Usuario(admin.ModelAdmin):
	list_display=(
		"dui", 
		"nombres", 
		"apellidos", 
		"departamento", 
		"municipio",
		"fecha_nacimiento",
		"correo",
		"password")
	search_fields=(
		"dui", 
		"nombres", 
		"apellidos", 
		"departamento", 
		"municipio",
		"fecha_nacimiento",
		"correo",
		"password")

admin.site.register(Usuario, Class_Admin_Usuario)