from django.db import models
from django.contrib.auth.models import AbstractUser
import django.utils.timezone

# Create your models here.
class CustomUser(AbstractUser):
    roles = (
        ('Purchase Officer', 'Purchase Officer'),
        ('Principal Office', 'Principal Office'),
        ('Store Manager', 'Store Manager'),
        ('Lab-Incharge', 'Lab-Incharge'),
        ('Student', 'Student'),
        ('Teacher', 'Teacher')
    )
    departments = (
        ('MCA', 'MCA'),
        ('IT', 'IT'),
        ('CE', 'CE'),
        ('EXTC', 'EXTC'),
        ('INSTRUMENT', 'INSTRUMENT')
    )
    email = models.CharField(max_length=50, unique = True)
    #password = models.CharField(max_length=40, blank=True, null=True)
    mobile = models.CharField(max_length=10)
    role = models.CharField(max_length=20,choices = roles, null=True)
    department = models.CharField(max_length=20,choices = departments,  blank=True, null=True)
    # is_staff = models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status', editable = False),
    # is_active = models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active', editable = False),
    # date_joined = models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined', editable = False),
    # groups=  models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups', editable = False),
    # user_permissions = models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions', editable = False),
    # last_login = models.DateTimeField(blank=True, null=True, verbose_name='last login'),
    # is_superuser = models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status', editable = False),
    
    REQUIRED_FIELDS = ['mobile']
    USERNAME_FIELD = 'email'

    def __str__(self):
        return self.email