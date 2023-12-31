from django.db import models
from account.models import User
# Assuming you have a common base model for all products


class BaseProduct(models.Model):
    name = models.CharField(max_length=100)
    price = models.FloatField()
    image = models.ImageField(upload_to='products')
    description = models.TextField()

    # class Meta:
    #     abstract = True


class MensCloths(BaseProduct):
    # Additional fields specific to MensCloths, if any
    pass


class MensShoes(BaseProduct):
    # Additional fields specific to MensShoes, if any
    pass


class MensWatches(BaseProduct):
    # Additional fields specific to MensWatches, if any
    pass


class WomensHandbags(BaseProduct):
    # Additional fields specific to WomensHandbags, if any
    pass


class WomensGlasses(BaseProduct):
    # Additional fields specific to WomensGlasses, if any
    pass


class BaseCartWhiteList(models.Model):
    user = models.ForeignKey(
        User, related_name='basecartwhitelist', on_delete=models.CASCADE)
    product = models.ForeignKey(BaseProduct, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    def get_queryset(self):
        user = self.request.user
        return BaseCartWhiteList.objects.filter(user=user)

    def __str__(self):
        return f'{self.product.name}'


class Cart(BaseCartWhiteList):
    # add the necessary fields here that can override
    pass


class Whitelist(BaseCartWhiteList):
    pass


class Checkout(models.Model):

    user = models.ForeignKey(
        User, related_name='checkouts', on_delete=models.SET_NULL, null=True)
    product = models.ForeignKey(
        BaseCartWhiteList, on_delete=models.SET_NULL, null=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)

    country_choices = [('Nepal', 'Nepal'), ('India', 'India'),
                       ('Pakistan', 'Pakistan'), ('Japan', 'Japan')]
    city_choices = [('Kathmandu', 'Kathmandu'), ('Lalitpur',
                                                 'Lalitpur'), ('Bhaktapur', 'Bhaktapur')]
    payment_method_choices = [
        ('esewa', 'eSewa'), ('khalti', 'Khalti'), ('visa', 'Visa'), ('cash', 'Cash')]

    country = models.CharField(max_length=100, choices=country_choices)
    city = models.CharField(max_length=100, choices=city_choices)
    address = models.TextField()
    mobile_number = models.IntegerField()
    order_note = models.TextField()
    payment_method = models.CharField(
        max_length=100, choices=payment_method_choices)

    def get_queryset(self):
        user = self.request.user
        return Checkout.objects.filter(user=user)

    def __str__(self):
        return f'{self.user.email} - {self.product.name}'


class PrintBill(Checkout):
    pass
