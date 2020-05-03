from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

#User = get_user_model()


# Create your models here.
class User(AbstractUser):
    is_customer = models.BooleanField('customer status', default=False)
    is_restaurant = models.BooleanField('restaurant status', default=False)




class Customer_Profile(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="ProfileCustomer")
	mob = models.IntegerField(blank=True,null=True)
	preference = models.TextField(blank=True,null=True)

class Restaurant_Profile(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='ProfileRestaurant')
	mob = models.IntegerField(blank=True,null=True)
	location = models.TextField(blank=True,null=True)
	restaurantname = models.TextField(blank=True,null=True)

@receiver(post_save, sender=User)
def update_user_profile(sender, instance, created, **kwargs):
	if created:
		if instance.is_customer:
			Customer_Profile.objects.create(user=instance)
		else:
			Restaurant_Profile.objects.create(user=instance)
	if instance.is_customer:
		instance.ProfileCustomer.save()
	else:
		instance.ProfileRestaurant.save()
	
	
	