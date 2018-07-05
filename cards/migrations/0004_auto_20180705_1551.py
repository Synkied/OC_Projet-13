# Generated by Django 2.0.6 on 2018-07-05 13:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cards', '0003_auto_20180705_1542'),
    ]

    operations = [
        migrations.AlterField(
            model_name='card',
            name='card_set',
            field=models.CharField(blank=True, help_text='The set the card appears in (ex. BREAKthrough, Phantom Forces, Jungle, etc.)', max_length=100, null=True),
        ),
    ]
