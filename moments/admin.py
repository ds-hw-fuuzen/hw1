from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import WeChatUser, Status


admin.site.register(WeChatUser)
admin.site.register(Status)