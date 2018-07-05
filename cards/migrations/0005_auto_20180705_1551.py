# Generated by Django 2.0.6 on 2018-07-05 13:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cards', '0004_auto_20180705_1551'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='card',
            name='number',
        ),
        migrations.AddField(
            model_name='card',
            name='number_in_set',
            field=models.PositiveIntegerField(blank=True, help_text='The number of the card for the set it was released in. Found on the bottom right side of the card.', null=True),
        ),
    ]
