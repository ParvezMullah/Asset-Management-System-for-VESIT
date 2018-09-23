from django.db import models

# Create your models here.
class Assets(models.Model):
    asset_name = models.CharField(max_length=30)

    def __str__(self):
        if self.asset_name==None:
            return "ERROR-CUSTOMER NAME IS NULL"
        return self.asset_name
