from django.db import models

# Create your models here.

class Usuario(models.Model):
    dui = models.CharField(db_column='DUI', primary_key=True, max_length=10)  # Field name made lowercase.
    nombres = models.CharField(db_column='NOMBRES', max_length=40)  # Field name made lowercase.
    apellidos = models.CharField(db_column='APELLIDOS', max_length=40)  # Field name made lowercase.
    departamento = models.CharField(db_column='DEPARTAMENTO', max_length=20)  # Field name made lowercase.
    municipio = models.CharField(db_column='MUNICIPIO', max_length=20)  # Field name made lowercase.
    fecha_nacimiento = models.DateField(db_column='FECHA_NACIMIENTO')  # Field name made lowercase.
    correo = models.CharField(db_column='CORREO', max_length=40)  # Field name made lowercase.
    contrasena = models.CharField(db_column='CONTRASENA', max_length=16)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'usuario'