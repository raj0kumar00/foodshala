from django import forms
from django.contrib.auth.forms import UserCreationForm
#from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from .models import Customer_Profile,Restaurant_Profile
from django.forms import ModelForm, TextInput,EmailInput,PasswordInput

mypreference = [
	("veg","veg"),
	("non-veg","non-veg")
]
User = get_user_model()
class baseform(UserCreationForm):
	password1 = forms.CharField(max_length=16, widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Password'}))
	password2 = forms.CharField(max_length=16, widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Confirm Password'}))
	email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.',widget=forms.EmailInput(attrs={'class': 'form-control','placeholder': 'Email Address'}))
	mob = forms.IntegerField(required=False,help_text='optional.',widget=forms.TextInput(attrs={'class': 'form-control','placeholder' : "Mobile Number"}))

class customer_signup(baseform):
	preference = forms.CharField(widget=forms.Select(choices=mypreference,attrs={'class': 'form-control mdb-select md-form btn-block',}))
	class Meta:
		model = User
		field_order = ('username', 'email', 'mob', 'password1', 'password2', 'preference')
		fields = ('username', 'email', 'mob', 'password1', 'password2','preference' )
		widgets = {
			'username': TextInput(attrs={'class': 'form-control','placeholder': 'Username'}),
			}
class restaurant_signup(baseform):
	location = forms.CharField(max_length=254, help_text='Enter location',widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'location'}))
	restaurantname = forms.CharField(max_length=254, help_text='Enter restaurant name',widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'restaurant'}))
	class Meta:
		model = User
		field_order = ('username', 'email', 'mob', 'password1', 'password2', 'location','restaurantname')
		fields = ('username', 'email', 'mob', 'password1', 'password2','location', 'restaurantname' )
		widgets = {
			'username': TextInput(attrs={'class': 'form-control','placeholder': 'Username'}),
			}