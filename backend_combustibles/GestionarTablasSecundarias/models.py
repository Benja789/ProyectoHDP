from django.db import models

# Create your models here.
class Gasolina(models.Model):
    idgasolina = models.CharField(db_column='IDGASOLINA', primary_key=True, max_length=5)  # Field name made lowercase.
    tipogasolina = models.CharField(db_column='TIPOGASOLINA', max_length=15)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'GASOLINA'


class Periodo(models.Model):
    idperiodo = models.AutoField(db_column='IDPERIODO', primary_key=True)  # Field name made lowercase.
    fechainicio = models.DateField(db_column='FECHAINICIO')  # Field name made lowercase.
    fechafin = models.DateField(db_column='FECHAFIN')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PERIODO'


class Zona(models.Model):
    idzona = models.CharField(db_column='IDZONA', primary_key=True, max_length=5)  # Field name made lowercase.
    nombrezona = models.CharField(db_column='NOMBREZONA', max_length=15)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ZONA'