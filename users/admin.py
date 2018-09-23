from django.contrib import admin
from .models import(
    CustomUser
)
class CustomUserAdmin(admin.ModelAdmin):
    list_display = [ 'email', 'first_name','last_name', 'mobile', 'role', 'department']
    list_per_page = 10
    
    class Meta:
        model = CustomUser

admin.site.site_header = 'LostAndFound Admininstration'
admin.site.register(CustomUser, CustomUserAdmin)
