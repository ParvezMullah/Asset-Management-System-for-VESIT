# Generated by Django 2.0.5 on 2018-09-23 22:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20180924_0405'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customuser',
            name='role',
            field=models.CharField(choices=[('Purchase Officer', 'Purchase Officer'), ('Principal Office', 'Principal Office'), ('Store Manager', 'Store Manager'), ('Lab-Incharge', 'Lab-Incharge'), ('Student', 'Student'), ('Teacher', 'Teacher')], max_length=20, null=True),
        ),
    ]
