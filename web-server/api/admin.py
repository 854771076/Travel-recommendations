from django.contrib import admin
from api.models import *
from django.contrib.admin import DateFieldListFilter
# Register your models here.
admin.site.site_header='后台管理'
admin.site.site_title='后台管理'
@admin.register(user)
class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'email','last_login') # list
    search_fields = ('username',)
    ordering=['-date_joined']
    list_filter=[('date_joined',DateFieldListFilter)]

# @admin.register(Logs)
# class LogsAdmin(admin.ModelAdmin):
#     list_display = ('user','active','content', 'create_time') # list
#     search_fields = ('user__username',)
#     ordering=['-create_time']
#     list_filter=[('create_time',DateFieldListFilter),'active']


@admin.register(Recommendforallusers)
class RecommendforallusersAdmin(admin.ModelAdmin):
    list_display = ('user_id', 'recommendations') # list
    search_fields = ('user_id',)
    list_filter=['user_id']



@admin.register(UserResume)
class UserResumeAdmin(admin.ModelAdmin):
    list_display = ('id', 'user','city1','city2','city3','topicTranslation','low_price','high_price') # list
    search_fields = ('user__username',)
    ordering=['-created_time','-last_update']
    list_filter=['user','topicTranslation']
@admin.register(hot_TOP20)
class hot_TOP20Admin(admin.ModelAdmin):
    list_display = ('name','weight' ) # list
    def name(self,obj):
        return Travel.objects.get(pk=obj.id)
@admin.register(Travel)
class TravelAdmin(admin.ModelAdmin):
    list_display = ('id', 'name','cityTranslation','low_price','high_price','topic','topicTranslation') # list
    search_fields = ('name',)

@admin.register(StarTravel)
class StarTravelAdmin(admin.ModelAdmin):
    list_display = ('user', 'travel','create_time') # list
    search_fields = ('user_id',)
    ordering=['-create_time']
    list_filter=['user_id', 'travel_id']
    list_display_links =['user', 'travel']
@admin.register(ClickTravel)
class ClickTravelAdmin(admin.ModelAdmin):
    list_display = ('user', 'travel','create_time','count','last_update') # list
    search_fields = ('user_id',)
    ordering=['-create_time','-last_update']
    list_filter=['user_id', 'travel_id']
    list_display_links =['user', 'travel']
@admin.register(CommentTravel)
class ClickTravelAdmin(admin.ModelAdmin):
    list_display = ('user', 'travel','create_time','content') # list
    search_fields = ('user_id',)
    ordering=['-create_time']
    list_filter=['user_id', 'travel_id']
    list_display_links =['user', 'travel']