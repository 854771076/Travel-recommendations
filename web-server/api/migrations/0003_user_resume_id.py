# Generated by Django 3.2.5 on 2023-12-22 13:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_auto_20231222_1253'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='resume_id',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
