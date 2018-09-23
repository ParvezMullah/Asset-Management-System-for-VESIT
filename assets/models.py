from django.db import models

# Create your models here.
class Assets(models.Model):
    asset_name = models.CharField(max_length=30, primary_key=True)

    def __str__(self):
        if self.asset_name==None:
            return "ERROR-CUSTOMER NAME IS NULL"
        return self.asset_name

    class Meta:
        verbose_name_plural = "assets"

class AssetPurchase(models.Model):
    asset_name = models.OneToOneField(Assets, on_delete=models.CASCADE,)
    asset_quantity = models.IntegerField()
    date_purchased = models.DateField()
    date_added = models.DateTimeField(auto_now_add=True)
    total_price = models.IntegerField(help_text='In Thousands')

    def __str__(self):
        return self.asset_name
