from django.urls import path,include
from accounts import views
app_name='account'
urlpatterns = [
    path('csignup/',views.csignup, name="csignup"),
	path('rsignup/',views.rsignup, name="rsignup"),
	path('home/',views.home, name="home"),
	path('login/',views.login_request,name='login'),
	path('logout/',views.logout_request,name='logout')
]
