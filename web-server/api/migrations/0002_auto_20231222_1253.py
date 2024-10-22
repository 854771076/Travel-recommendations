# Generated by Django 3.2.5 on 2023-12-22 12:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userresume',
            name='high_price',
            field=models.FloatField(blank=True, default=100000, null=True, verbose_name='期望最高经费'),
        ),
        migrations.AlterField(
            model_name='userresume',
            name='low_price',
            field=models.FloatField(blank=True, default=0, null=True, verbose_name='期望最低经费'),
        ),
    ]
