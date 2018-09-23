from django.contrib import admin
from .models import(
    AssetRequest
)
# Register your models here.

class AssetRequestAdmin(admin.ModelAdmin):
    list_display = [ 'email','role', 'asset_name','quantity_required', 'expected_date', 'status', 'last_updated_by_role']
    list_per_page = 10
    
    class Meta:
        model = AssetRequest

admin.site.register(AssetRequest, AssetRequestAdmin)