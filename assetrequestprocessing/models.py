from django.db import models
import django.utils.timezone
from assets.models import(
    Assets
)
from users.models import(
    CustomUser
)
# Create your models here.
class AssetRequest(models.Model):
    email = models.CharField(max_length=40, blank=True, null=True)
    asset_name = models.ForeignKey(Assets, on_delete=models.CASCADE,)
    quantity_required = models.IntegerField()
    expected_date   = models.DateField()
    status = models.CharField(default = 'requested', max_length = 30)
    role = models.CharField(max_length = 40, )
    last_updated_by_role = models.CharField(max_length = 30, default = 'self')
    requesting_date = models.DateField(django.utils.timezone.now)
    last_update = models.DateField(auto_now=True)
    #department = models.ForeignKey(CustomUser, db_column = 'department', on_delete=models.CASCADE, default = 'MCA')
    department = models.CharField(max_length=50, blank=True, null=True)

    # def __str__(self):
    #     return (self.asset_name)
    class Meta:
        ordering = ['-id']