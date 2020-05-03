from django.shortcuts import render,HttpResponse
from django.contrib import messages
from django.contrib.auth import login, authenticate,logout
from django.contrib.auth.forms import UserCreationForm,AuthenticationForm
from django.shortcuts import render, redirect
from .forms import customer_signup,restaurant_signup
def csignup(request):
	if request.method == 'POST':
		form = customer_signup(request.POST)
		error_checker = form
		if form.is_valid():
			user=form.save(commit=False)
			user.is_customer=True
			user.save()
			user.refresh_from_db()
			user.ProfileCustomer.mob = form.cleaned_data.get('mob')
			user.ProfileCustomer.preference = form.cleaned_data.get('preference')
			user.save()
			username = form.cleaned_data.get('username')
			raw_password = form.cleaned_data.get('password1')
			user = authenticate(username=username, password=raw_password)
			login(request, user)
			return redirect('foodshala:menu')
		else:
			form = customer_signup()
			return render(request, 'accounts/customer_signup.html', {'form': form,'myform': error_checker})
	else:
		form = customer_signup()
	return render(request, 'accounts/customer_signup.html', {'form': form})
def rsignup(request):
	if request.method == 'POST':
		form = restaurant_signup(request.POST)
		error_ckecker = form
		if form.is_valid():
			user=form.save()
			user.is_restaurant=True
			user.save()
			user.refresh_from_db()
			user.ProfileRestaurant.mob = form.cleaned_data.get('mob')
			user.ProfileRestaurant.location = form.cleaned_data.get('location')
			user.ProfileRestaurant.restaurantname = form.cleaned_data.get('restaurantname')
			user.save()
			username = form.cleaned_data.get('username')
			raw_password = form.cleaned_data.get('password1')
			user = authenticate(username=username, password=raw_password)
			login(request, user)
			return redirect('foodshala:menu')
		else:
			form = restaurant_signup()
			return render(request, 'accounts/restaurant_signup.html', {'form': form,'myform': error_checker})
	else:
		form = restaurant_signup()
	return render(request, 'accounts/restaurant_signup.html', {'form': form})

def login_request(request):
	if request.method == 'POST':
		form = AuthenticationForm(request=request, data=request.POST)
		if form.is_valid():
			username = form.cleaned_data.get('username')
			password = form.cleaned_data.get('password')
			user = authenticate(username=username, password=password)
			if user is not None:
				if user.is_customer:
					login(request, user)
					messages.info(request, f"You are now logged in as {username}")
					return redirect('/menu')
				if user.is_restaurant:
					login(request, user)
					messages.info(request, f"You are now logged in as {username}")
					try:
						next = request.GET['next']
					except:
						return redirect('/additems')
			else:
				messages.error(request, "Invalid username or password.")
		else:
			messages.error(request, "Invalid username or password.")
	form = AuthenticationForm()
	return render(request = request,
					template_name = "accounts/login.html")

def logout_request(request):
    logout(request)
    messages.info(request, "Logged out successfully!")
    return redirect("account:login")

def home(request):
	return HttpResponse("nice")