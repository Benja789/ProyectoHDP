from django.db import models
from GestionUsuario.models import Usuario
from GestionarTablasSecundarias.models import Zona
from GestionarTablasSecundarias.models import Periodo
from GestionarTablasSecundarias.models import Gasolina

# Create your models here.
class Prediccion(models.Model):
    idprediccion = models.AutoField(db_column='IDPREDICCION', primary_key=True)  # Field name made lowercase.
    dui = models.ForeignKey('GestionUsuario.Usuario', models.DO_NOTHING, db_column='DUI', blank=True, null=True)  # Field name made lowercase.
    idperiodo = models.ForeignKey(Periodo, models.DO_NOTHING, db_column='IDPERIODO', blank=True, null=True)  # Field name made lowercase.
    idzona = models.ForeignKey('GestionarTablasSecundarias.Zona', models.DO_NOTHING, db_column='IDZONA', blank=True, null=True)  # Field name made lowercase.
    idgasolina = models.ForeignKey(Gasolina, models.DO_NOTHING, db_column='IDGASOLINA', blank=True, null=True)  # Field name made lowercase.
    precio = models.FloatField(db_column='PRECIO')  # Field name made lowercase.
    variacion = models.FloatField(db_column='VARIACION')  # Field name made lowercase.
    estado = models.CharField(db_column='ESTADO', max_length=12)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PREDICCION'