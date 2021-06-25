from django.contrib import admin
from Prediccion.models import *

# Register your models here.
class Class_Admin_Prediccion(admin.ModelAdmin):
	list_display=(
		"idprediccion",
		"dui",
		"idperiodo",
		"idzona",
		"idgasolina",
		"precio",
		"variacion",
		"estado")
	search_fields=(
		"idprediccion",
		"dui",
		"idperiodo",
		"idzona",
		"idgasolina",
		"precio",
		"variacion",
		"estado")

admin.site.register(Prediccion, Class_Admin_Prediccion)
