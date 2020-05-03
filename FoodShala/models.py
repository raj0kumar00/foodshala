from django.db import models
from django.conf import settings
from django.utils import timezone

items_type =[
	("veg" , "veg"),
	("non-veg", "non-veg")
]
class item_details(models.Model):
	user = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE, related_name="item")
	resto_name = models.CharField(max_length=50)
	name = models.CharField(max_length=40)
	category = models.CharField(max_length=40)
	tag = models.CharField(max_length=40)
	item_type = models.CharField(max_length=10,choices=items_type, default=1)
	image = models.ImageField(upload_to="uploads/itemsimg/")
	price = models.IntegerField()
	created_date = models.DateTimeField(default=timezone.now)
	def __str__(self):
		return self.name
class active_orders_details(models.Model):
	order_by_id = models.IntegerField()
	order_by_name = models.CharField(max_length=50)
	food_id = models.IntegerField()
	address = models.TextField(max_length=100)
	resturent = models.CharField(max_length=20,null=True)
	food_name = models.CharField(max_length=50,null=True)
	price = models.IntegerField(null=True)
	created_date = models.DateTimeField(default=timezone.now)

