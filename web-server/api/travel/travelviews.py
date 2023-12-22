from rest_framework import viewsets
from .serializers import *
from api.models import *
from rest_framework.permissions import *
from rest_framework_simplejwt.authentication import JWTAuthentication
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter,OrderingFilter
from django_filters import rest_framework as filters
from rest_framework.decorators import action
import csv
from django.db.models import  *
from django.db.models.functions import *
from rest_framework import permissions
from rest_framework.response import Response
import random

from rest_framework import generics
from django.db.models import Q

class SimilarTravelList(generics.ListAPIView):
	serializer_class = TravelSerializer

	def get_queryset(self):
		id = self.kwargs.get('id')
		travel = Travel.objects.get(id=id)

		query = (
			Q(city=travel.industryname) &
			Q(topic=travel.topic) &
			Q(low_price__lte=travel.low_price) &
			Q(high_price__gte=travel.high_price)
		)

		similar_Travel = Travel.objects.filter(query).exclude(id=id)
		return similar_Travel

def get_random_objects(queryset, num_objects):
	random_objects = []
	total_objects = queryset.count()
	if num_objects >= total_objects:
		return list(queryset)
	while len(random_objects) < num_objects:
		random_index = random.randint(0, total_objects - 1)
		random_object = queryset[random_index]
		if random_object not in random_objects:
			random_objects.append(random_object)
	return random_objects
class CustomPermission(permissions.BasePermission):
	def has_permission(self, request, view):
		# 在这里编写权限逻辑，返回 True 表示有权限，返回 False 表示没有权限
		if request.method=='GET' or (  request.method=='POST' ):
			return True
		else:
			
			return False
	def has_object_permission(self, request, view, obj):
		# 在这里编写对象级别的权限逻辑，返回 True 表示有权限，返回 False 表示没有权限
		return True


class TravelFilter(filters.FilterSet):
	id = filters.CharFilter(lookup_expr='exact')
	price=filters.NumberFilter(field_name='low_price', lookup_expr='gte')
	price2=filters.NumberFilter(field_name='high_price', lookup_expr='lte')
	city = filters.CharFilter(lookup_expr='exact')
	topic = filters.CharFilter(lookup_expr='exact')


	class Meta:
		model = Travel
		fields = '__all__'
class TravelViewSet(viewsets.ModelViewSet):
	authentication_classes = [JWTAuthentication]
	# 搜索
	filter_backends = [DjangoFilterBackend,SearchFilter, OrderingFilter]
	search_fields = ('name',)
	filterset_class =TravelFilter
	permission_classes = [CustomPermission]
	ordering_fields = ('create_time')
	queryset = Travel.objects
	serializer_class =TravelSerializer
	lookup_field ='id'
	@action(detail=False, methods=['POST'])
	def click(self,request):
		data={
			'code':'200',
			'data':None,
			'msg':'ok',
		}
		if request.user.is_authenticated:
			try:
				serializer=ClickSerializer(data=request.data)
				if serializer.is_valid():
					id=serializer.validated_data.get('id')
					travel=Travel.objects.filter(id=id).first()
					cli=ClickTravel.objects
					c=cli.filter(user=request.user,travel=travel)
					if not c.exists():
						cli.create(user=request.user,travel=travel)
					c.update(count=F('count')+1)
					data['data']=cli.filter(travel=travel).aggregate(sum=Sum('count'))
				else:
					# 参数有误
					data['code']='-1'
					data['msg']=serializer.errors	
			except Exception as e:
				data['code']='-1'
				data['data']=str(e)
				data['msg']='系统错误'
		else:
			serializer=ClickSerializer(data=request.data)
			if serializer.is_valid():
				id=serializer.validated_data.get('id')
				cli=ClickTravel.objects
				travel=Travel.objects.filter(id=id).first()
				data['data']=cli.filter(travel=travel).aggregate(sum=Sum('count'))
			else:
				data['code']='-1'
				data['msg']=serializer.errors
		
		return Response(data)
	@action(detail=False, methods=['POST'])
	def collect(self,request):
		data={
			'code':'200',
			'data':None,
			'msg':'ok',
		}
		if request.user.is_authenticated:
			try:
				serializer=CollectSerializer(data=request.data)
				if serializer.is_valid():
					id=serializer.validated_data.get('id')
					travel=Travel.objects.filter(id=id).first()
					star=StarTravel.objects
					if star.filter(user=request.user,travel=travel).exists():
						data['code']='-1'
						data['msg']='已收藏'
						return Response(data)
					star.create(user=request.user,travel=travel)
					data['data']=travel.to_dict('收藏')
				else:
					# 参数有误
					data['code']='-1'
					data['msg']=serializer.errors	
			except Exception as e:
				data['code']='-1'
				data['data']=str(e)
				data['msg']='系统错误'
		else:
			data['code']=-1
			data['msg']='请登录'
		return Response(data)
	@action(detail=False, methods=['GET'])
	def collectTravel(self,request):
		data={
			'code':'200',
			'data':[],
			'msg':'ok',
		}
		if request.user.is_authenticated:
			try:
				serializer=RecommendSerializer(data=request.GET)
				if serializer.is_valid():
					page=serializer.validated_data.get('page')
					pagesize=serializer.validated_data.get('pagesize')
					travel_list=[i.travel.to_dict(None) for i in StarTravel.objects.filter(user=request.user)[(page-1)*pagesize:page*pagesize]]
					
					data['data']=travel_list
				else:
					# 参数有误
					data['code']='-1'
					data['msg']=serializer.errors	
			except Exception as e:
				data['code']='-1'
				data['data']=str(e)
				data['msg']='系统错误'
		else:
			data['code']=-1
			data['msg']='请登录'
		return Response(data)
	@action(detail=False, methods=['GET'])
	def clickTravel(self,request):
		data={
			'code':'200',
			'data':[],
			'msg':'ok',
		}
		if request.user.is_authenticated:
			try:
				serializer=RecommendSerializer(data=request.GET)
				if serializer.is_valid():
					page=serializer.validated_data.get('page')
					pagesize=serializer.validated_data.get('pagesize')
					travel_list=[i.travel.to_dict(None) for i in ClickTravel.objects.filter(user=request.user)[(page-1)*pagesize:page*pagesize]]
					
					data['data']=travel_list
				else:
					# 参数有误
					data['code']='-1'
					data['msg']=serializer.errors	
			except Exception as e:
				data['code']='-1'
				data['data']=str(e)
				data['msg']='系统错误'
		else:
			data['code']=-1
			data['msg']='请登录'
		return Response(data)
	@action(detail=False, methods=['POST'])
	def iscollected(self,request):
		data={
			'code':'200',
			'data':None,
			'msg':'ok',
		}
		if request.user.is_authenticated:
			try:
				serializer=CollectSerializer(data=request.data)
				if serializer.is_valid():
					id=serializer.validated_data.get('id')
					travel=Travel.objects.filter(id=id).first()
					star=StarTravel.objects
					if star.filter(user=request.user,travel=travel).exists():
						data['data']=True
						data['msg']='已收藏'
						return Response(data)
					data['data']=False
					data['msg']='未收藏'
				else:
					# 参数有误
					data['code']='-1'
					data['msg']=serializer.errors	
			except Exception as e:
				data['code']='-1'
				data['data']=str(e)
				data['msg']='系统错误'
		else:
			data['code']=-1
			data['msg']='请登录'
		return Response(data)
	@action(detail=False, methods=['POST'])
	def removecollect(self,request):
		data={
			'code':'200',
			'data':None,
			'msg':'ok',
		}
		if request.user.is_authenticated:
			try:
				serializer=CollectSerializer(data=request.data)
				if serializer.is_valid():
					id=serializer.validated_data.get('id')
					travel=Travel.objects.filter(id=id).first()
					
					star=StarTravel.objects
					if not star.filter(user=request.user,travel=travel).exists():
						data['code']='-1'
						data['msg']='未收藏'
						return Response(data)
					star.filter(user=request.user,travel=travel).delete()
					data['data']=travel.to_dict('取消收藏')
				else:
					# 参数有误
					data['code']='-1'
					data['msg']=serializer.errors	
			except Exception as e:
				data['code']='-1'
				data['data']=str(e)
				data['msg']='系统错误'
		else:
			data['code']=-1
			data['msg']='请登录'
		return Response(data)
	@action(detail=False, methods=['GET'])
	def recommend(self,request):
		data={
			'code':'200',
			'data':None,
			'msg':'ok',
			'count':200
		}
		serializer=RecommendSerializer(data=request.GET)
		if serializer.is_valid():
			try:
				page=serializer.validated_data.get('page')
				pagesize=serializer.validated_data.get('pagesize')
				maxpage=10
				#最新随机列表limit
				newlimit=1000
				Travel=Travel.objects.order_by('-id')[:newlimit]
				if request.user.is_authenticated :
					user_id=request.user.id
					if page==1:
						#首页实时推荐，根据收藏推荐
						star_travel_list=[i.travel for i in StarTravel.objects.filter(user_id=user_id).order_by('create_time')] 
						star_user_list=[i.user for i in StarTravel.objects.filter(travel__in=star_travel_list[:100]).exclude(user_id=user_id).distinct()]
						#点击
						click_travel_list=[i.travel for i in ClickTravel.objects.filter(user_id=user_id).order_by('create_time','count')] 
						click_user_list=[i.user for i in StarTravel.objects.filter(travel__in=click_travel_list[:100]).exclude(user_id=user_id).distinct()]
						similar_travel_list=StarTravel.objects.values('travel').filter(user__in=star_user_list[:100]).union(ClickTravel.objects.values('travel').filter(user__in=click_user_list[:100]))
						travel_list=[Travel.objects.get(id=i.get('travel')).to_dict('实时') for i in get_random_objects(similar_travel_list,pagesize//2)]
						length=len(travel_list)
						if length<pagesize:
							# 热门数据填充
							travel_id_list = [i.id for i in hot_TOP20.objects.all()]
							travel_list+=[i.to_dict('热门') for i in Travel.objects.filter(id__in=travel_id_list[:pagesize-length])]
						#填充完还小于pagesize条，使用travel数据随机填充
						length=len(travel_list)
						if length<pagesize:
							travel_list+=[i.to_dict('最新随机') for i in get_random_objects(Travel,pagesize-length)]
					else:
						#如果有离线推荐数据
						Rrecommend=Recommendforallusers.objects.filter(user_id=user_id)
						if Rrecommend.exists():
							travel_id_list=Rrecommend.first().recommend_travel_list[(page-2)*pagesize:page*pagesize]
							travel_list=[i.to_dict('匹配') for i in Travel.objects.filter(id__in=travel_id_list)]
						else:
							# 热门数据填充
							# 获取热门的 travel_list
							travel_id_list = [i.id for i in hot_TOP20.objects.all()]
							travel_list=[i.to_dict('热门') for i in Travel.objects.filter(id__in=travel_id_list)]
							if travel_list==[] or len(travel_list)<pagesize:
								travel_list+=[i.to_dict('最新随机') for i in get_random_objects(Travel,pagesize-len(travel_list))]

				else:
					if page==1:
						# 热门数据填充
						travel_id_list = [i.id for i in hot_TOP20.objects.all()]
						travel_list=[i.to_dict('热门') for i in Travel.objects.filter(id__in=travel_id_list)]
						#最新随机数据填充
						if travel_list==[] or len(travel_list)<pagesize:
								travel_list+=[i.to_dict('最新随机') for i in get_random_objects(Travel,pagesize-len(travel_list))]
					else:
						travel_list=[i.to_dict('最新随机') for i in get_random_objects(Travel,pagesize)]
				data['data']=travel_list
				data['page']=page
			except Exception as e:
				data['code']='-1'
				data['data']=str(e)
				data['msg']='系统错误'
		else:
			# 参数有误
			data['code']='-1'
			data['msg']=serializer.errors
		return Response(data)