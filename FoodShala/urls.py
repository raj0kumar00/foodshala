from django.urls import path,include
from FoodShala import views
from django.conf import settings
from django.conf.urls.static import static

app_name="foodshala"
urlpatterns = [
    path('',views.HomePage, name="HomePage"),
    path('items/',views.items,name='items'),
    path('additems/',views.additems,name='additems'),
    path('cart/',views.cart,name='cart'),
    path('vieworders/',views.vieworders,name='vieworders'),
    path('menu/',views.menu,name='menu'),
    path('myitems/',views.myitems,name='myitems'),
    path('cart/',views.cart,name='cart'),
    path('cart/confirm/',views.confirm, name='confirm'),
    path('active_orders/',views.active_orders, name='active_orders')
]

if settings.DEBUG:
    urlpatterns = urlpatterns + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)