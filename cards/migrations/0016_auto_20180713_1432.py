# Generated by Django 2.0.6 on 2018-07-13 12:32

from django.db import migrations, models
import utils


class Migration(migrations.Migration):

    dependencies = [
        ('cards', '0015_auto_20180710_1716'),
    ]

    operations = [
        migrations.AlterField(
            model_name='card',
            name='image',
            field=models.ImageField(blank=True, null=True, storage=utils.OverwriteStorage(), upload_to='cards/'),
        ),
    ]
