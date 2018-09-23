from django.contrib import admin

from .models import(
    Assets,
    AssetPurchase,
)
# Register your models here.
class AssetPurchaseAdmin(admin.ModelAdmin):
    list_display = [ 'asset_name', 'asset_quantity','total_price', 'date_purchased']
    list_per_page = 10
    
    class Meta:
        model = AssetPurchase

admin.site.register(AssetPurchase, AssetPurchaseAdmin)
admin.site.register(Assets)
