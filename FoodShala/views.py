from django.shortcuts import render,HttpResponse,redirect
from .decorators import restaurant_required, customer_required
from django.contrib.auth.decorators import login_required
from .forms import item_details
from django.conf import settings
from .models import item_details as get_all_items
from .forms import active_order
from .models import active_orders_details as active_data
from accounts.models import Restaurant_Profile
# Create your views here.
def HomePage(request):
	return render(request,"foodshala/index.html")
def items(request):
	return HttpResponse("item page")



@login_required(login_url="/login/")
@customer_required
def cart(request):
	return HttpResponse("nice")

@login_required(login_url="/login/")
@restaurant_required
def vieworders(request):
	return HttpResponse("nice to meet you")


@login_required(login_url="/login/")
@restaurant_required
def additems(request):
	if request.method=='POST':
		form = item_details(request.POST,request.FILES)
		error_checker=form
		if form.is_valid():
			user=form.save(commit=False)
			user.user=request.user
			resto_name = Restaurant_Profile.objects.get(user_id=request.user.id).restaurantname
			user.resto_name = resto_name
			user.save()
			return redirect("foodshala:myitems")
		else:
			form = item_details()
			return render(request,'foodshala/additem.html', context={"form" : form, "myform" : error_checker})

	form = item_details()
	return render(request,"foodshala/additem.html", context={"form" : form})

@login_required(login_url="/login/")
@restaurant_required
def myitems(request):
	data = get_all_items.objects.filter(user=request.user)
	return render(request,'foodshala/myitems.html', context= {"data" : data})

def menu(request):
	data = get_all_items.objects.all()
	return render(request, "foodshala/menu.html",context={"data": data})

@login_required(login_url="/login/")
def cart(request):
	if request.method == "GET":
		item_id = request.GET['food_id']
		data = get_all_items.objects.get(id= item_id)
	return render(request,"foodshala/cart.html",context={'data' : data})
def confirm(request):
	if request.method == 'POST':
		data = request.POST.dict()
		food_id = data.get("food_id")
		address = data.get("address")
		current_user = request.user
		order_by_id = current_user.id
		order_by_name = current_user.username
		temp_data = get_all_items.objects.get(id = food_id)
		resturnt = temp_data.user
		food_name = temp_data.name
		price = temp_data.price
		mydata = active_data(order_by_id=order_by_id,
								order_by_name=order_by_name,
								food_id=food_id,
								address = address,
								resturent=resturnt,
								price = price,
								food_name = food_name,

								)
		mydata.save()
		return redirect("foodshala:active_orders")
	return redirect("foodshala:menu")
def active_orders(request):
	current_user = request.user
	user_id = current_user.id
	if current_user.is_restaurant:
		data = active_data.objects.filter(resturent=current_user.username)
		return render(request,"foodshala/active_order.html",context={"data" : data})
	data = active_data.objects.filter(order_by_id=user_id)
	return render(request,"foodshala/active_order.html",context={"data" : data})