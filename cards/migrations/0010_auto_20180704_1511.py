# Generated by Django 2.0.6 on 2018-07-04 13:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cards', '0009_auto_20180704_1205'),
    ]

    operations = [
        migrations.AlterField(
            model_name='card',
            name='pokemon',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='cards', to='pokemons.Pokemon'),
        ),
    ]
