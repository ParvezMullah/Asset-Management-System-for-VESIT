"""AssetManagementSystemForVESIT URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static
from .views import(
    AssetRequestCreateView,
    AssetRequestListView, 
    AssetRequestUpdateView,
    AssetRequestDeleteView,
    AssetRequestStatusListView,
    AssetRequestStatusUpdateView,
    AssetRequestApprovedListView,
)
app_name = 'users'
urlpatterns = [
    path('admin/', admin.site.urls),
    path('addrequest/', AssetRequestCreateView.as_view(), name = 'addrequest'),
    path('myrequest/', AssetRequestListView.as_view(), name = 'myrequest'),
    path('updaterequest/<int:pk>/', AssetRequestUpdateView.as_view(), name = 'updaterequest'),
    path('deleterequest/<int:pk>/', AssetRequestDeleteView.as_view(), name = 'deleterequest'),
    path('pendingrequest/', AssetRequestStatusListView.as_view(), name = 'pendingrequest' ),
    path('statusupdate/<int:pk>/', AssetRequestStatusUpdateView.as_view(), name = 'statusupdate' ),
    path('approvedstatus', AssetRequestApprovedListView.as_view(), name = 'approvedstatus')
    
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
