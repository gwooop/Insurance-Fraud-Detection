from django.contrib import admin

# Register your models here.
from ins.models import CustData, ClaimData
admin.site.register(CustData)
admin.site.register(ClaimData)