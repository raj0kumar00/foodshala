
from django.contrib import admin
from django.urls import path,include
from FoodShala import urls as FoodShalaUrls
from accounts import urls as AccountUrls
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',include(FoodShalaUrls), name="FoodShala"),
    path('',include(AccountUrls),name="AccountUrls"),
]
