from django.urls import path
from . import views

urlpatterns = [
    path('', views.ins, name='ins'),
    path('<int:cust_id>', views.ins, name='ins')
]