# Generated by Django 3.1.2 on 2021-06-21 23:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('GestionarTablasSecundarias', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='gasolina',
            table='GASOLINA',
        ),
        migrations.AlterModelTable(
            name='periodo',
            table='PERIODO',
        ),
        migrations.AlterModelTable(
            name='zona',
            table='ZONA',
        ),
    ]