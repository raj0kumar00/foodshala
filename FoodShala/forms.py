from django import forms
from django.contrib.auth.models import User
from .models import item_details, active_orders_details
from django.forms import ModelForm, TextInput,EmailInput,PasswordInput

class item_details(forms.ModelForm): 
    class Meta: 
        model = item_details
        fields = ('name', 'category', 'tag', 'item_type', 'image', 'price' )

class active_order(forms.ModelForm):
	class Meta:
		model : active_orders_details
		fields = ('address','order_by_id', 'order_by_name','food_id', 'resturent')