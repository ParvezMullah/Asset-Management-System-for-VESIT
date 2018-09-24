from django.shortcuts import render
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.shortcuts import render, get_object_or_404
from django.utils.decorators import method_decorator
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView, UpdateView, DeleteView 
import django.utils.timezone
from assetrequestprocessing.models import(
    AssetRequest
)
from assets.models import(
    AssetStock
)
# Create your views here.

def home(request):
    template_name='users/home.html'
    return render(request, template_name)

class AssetRequestCreateView(SuccessMessageMixin, CreateView):
    model = AssetRequest
    fields = [f.name for f in AssetRequest._meta.get_fields()]
    fields.remove('email')
    fields.remove('status')
    fields.remove('role')
    fields.remove('last_updated_by_role')
    fields.remove('requesting_date')
    fields.remove('last_update')
    fields.remove('department')
    template_name = "users/add-request.html"
    success_message = 'request added successfully.'
    success_url = '/users/myrequest'

    def form_valid(self, form):
        print(self.request.user.role)
        form.instance.email = self.request.user.email
        form.instance.status = 'Requested'
        form.instance.requesting_date = django.utils.timezone.now()
        form.instance.role = self.request.user.role
        form.instance.last_updated_by_role = self.request.user.role
        form.instance.last_update = django.utils.timezone.now()
        form.instance.department = self.request.user.department
        return super(AssetRequestCreateView, self).form_valid(form)


class AssetRequestListView(ListView):
    model = AssetRequest
    template_name = "users/my-request.html"
    paginate_by = 10

    def get_queryset(self):
        queryset = super(AssetRequestListView, self).get_queryset()
        queryset = queryset.filter(email = self.request.user.email)
        return queryset 

class AssetRequestUpdateView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = AssetRequest
    fields = [f.name for f in AssetRequest._meta.get_fields()]
    fields.remove('email')
    fields.remove('status')
    fields.remove('role')
    fields.remove('last_updated_by_role')
    fields.remove('requesting_date')
    fields.remove('last_update')
    fields.remove('department')
    template_name = "users/update-request.html"
    success_message = 'request updated successfully.'
    success_url = '/users/myrequest'

    def form_valid(self, form):
        form.instance.last_update = django.utils.timezone.now()
        form_valid = super(AssetRequestUpdateView, self).form_valid(form)
        return form_valid


class AssetRequestDeleteView(LoginRequiredMixin, SuccessMessageMixin, DeleteView):
    model = AssetRequest
    template_name = "users/delete-request.html"
    success_message = 'deleted successfully.'
    success_url = '/users/myrequest/'

    def delete(self, request, *args, **kwargs):
        messages.success(self.request, self.success_message)
        return super(AssetRequestDeleteView, self).delete(request, *args, **kwargs)


class AssetRequestStatusListView(ListView):
    model = AssetRequest
    fields = [f.name for f in AssetRequest._meta.get_fields()]
    template_name = "users/pending-request.html"
    paginate_by = 10

    def get_queryset(self):
        queryset = super(AssetRequestStatusListView, self).get_queryset()
        current_user_role = self.request.user.role
        if current_user_role == 'Purchase Officer':
            queryset = queryset.filter(status = 'requested')
            queryset = queryset.filter(department = self.request.user.department)
        elif current_user_role == 'Principal Office':
            queryset = queryset.filter(status = 'initiated')
        else:
            queryset = ''
        return queryset 
    
    
class AssetRequestStatusUpdateView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = AssetRequest
    fields = ['status']
    template_name = "users/status-update.html"
    success_message = 'request updated successfully.'
    success_url = '/users/pendingrequest'

    def form_valid(self, form):
        form.instance.last_update = django.utils.timezone.now()
        form.instance.last_updated_by_role = self.request.user.role
        # selected_status = form.cleaned_data.get("status")
        # if selected_status == 'Recieved':
        #     qs =  AssetStock.objects.filter(asset_name_id = form.cleaned_data.get("asset_name_id"))
        #     # current_quantity = qs.asset_quantity
        #     required_quantity = form.cleaned_data.get("quantity_required")
        #     # if current_quantity > required_quantity:
        #     #     qs.asset_quantity = qs.asset_quantity - required_quantity
        #     #     qs.save()
        #     # else:
        #     #     print('Less Quantity is availabe')
        # else:
        #     print('status is' + selected_status)
        form_valid = super(AssetRequestStatusUpdateView, self).form_valid(form)
        return form_valid


class AssetRequestApprovedListView(ListView):
    model = AssetRequest
    template_name = "users/approved-request.html"
    paginate_by = 10

    def get_queryset(self):
        queryset = super(AssetRequestApprovedListView, self).get_queryset()
        current_user_role = self.request.user.role
        if current_user_role == 'Purchase Officer':
            queryset = queryset.filter(status = 'approved')
            queryset = queryset.filter(department = self.request.user.department)
        elif current_user_role == 'Store Manager':
            queryset = queryset.filter(status = 'approved')
        else:
            queryset = ''
        return queryset 

