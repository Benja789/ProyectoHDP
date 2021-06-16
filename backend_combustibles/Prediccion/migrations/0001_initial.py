# Generated by Django 3.1.2 on 2021-06-16 18:26

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Prediccion',
            fields=[
                ('idprediccion', models.AutoField(db_column='IDPREDICCION', primary_key=True, serialize=False)),
                ('precio', models.FloatField(db_column='PRECIO')),
                ('variacion', models.FloatField(db_column='VARIACION')),
                ('estado', models.CharField(db_column='ESTADO', max_length=12)),
            ],
            options={
                'db_table': 'prediccion',
                'managed': False,
            },
        ),
    ]
