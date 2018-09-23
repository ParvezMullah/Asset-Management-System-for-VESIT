from django.db import models
from django.db.models.signals import post_save

# Create your models here.
class Assets(models.Model):
    asset_name = models.CharField(max_length=30, primary_key=True)

    def __str__(self):
        if self.asset_name==None:
            return ""
        return self.asset_name

    class Meta:
        verbose_name_plural = "assets"

class AssetPurchase(models.Model):
    asset_name = models.ForeignKey(Assets, on_delete=models.CASCADE,)
    asset_quantity = models.IntegerField()
    date_purchased = models.DateField()
    date_added = models.DateTimeField(auto_now_add=True)
    total_price = models.IntegerField(help_text='In Thousands')

    # def __str__(self):
    #     if self.asset_name==None:
    #         return "null"
    #     return self.asset_name

    def save(self, *args, **kwargs):
        try:
            qs = AssetStock.objects.get(asset_name = self.asset_name)
            qs.asset_quantity = self.asset_quantity + self.asset_quantity
            qs.save()
        except AssetStock.DoesNotExist:
            p = AssetStock(asset_name=self.asset_name, asset_quantity=self.asset_quantity)
            p.save()
        super(AssetPurchase, self).save(*args, **kwargs) # Call the real save() method
    

class AssetStock(models.Model):
    asset_name = models.ForeignKey(Assets, on_delete=models.CASCADE,primary_key = True)
    asset_quantity = models.IntegerField()