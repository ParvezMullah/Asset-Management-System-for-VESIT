# Generated by Django 2.0.5 on 2018-09-23 22:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AssetPurchase',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('asset_quantity', models.IntegerField()),
                ('date_purchased', models.DateField()),
                ('date_added', models.DateTimeField(auto_now_add=True)),
                ('total_price', models.IntegerField(help_text='In Thousands')),
            ],
        ),
        migrations.CreateModel(
            name='Assets',
            fields=[
                ('asset_name', models.CharField(max_length=30, primary_key=True, serialize=False)),
            ],
            options={
                'verbose_name_plural': 'assets',
            },
        ),
        migrations.CreateModel(
            name='AssetStock',
            fields=[
                ('asset_name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='assets.Assets')),
                ('asset_quantity', models.IntegerField()),
            ],
        ),
        migrations.AddField(
            model_name='assetpurchase',
            name='asset_name',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='assets.Assets'),
        ),
    ]
