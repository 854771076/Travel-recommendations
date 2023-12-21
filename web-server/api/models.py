from django.db import models
from django.contrib.auth.models import AbstractUser
import os
from datetime import date
from django.db.models.signals import post_save
from django.dispatch import receiver
from json import dumps,loads
def user_directory_path(instance, filename):
    ext = filename.split('.').pop()
    filename = 'headerpic.'+ext
    return os.path.join(str(instance), filename)  # 系统路径分隔符差异，增强代码重用性
class Travel(models.Model):
    id=models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255,blank=True, null=True)
    topic=models.BigIntegerField( verbose_name='景点类型编码',default=0, null=True,blank=True)
    topicTranslation = models.CharField(max_length=255,blank=True, null=True)
    city=models.IntegerField(verbose_name='城市编码',default=0,null=True,blank=True)
    cityTranslation=models.CharField(max_length=20, verbose_name='城市', null=True,blank=True)
    low_price=models.IntegerField(verbose_name='最低门票',default=0, null=True,blank=True)
    high_price=models.IntegerField(verbose_name='最高门票',default=100000, null=True,blank=True)
    address = models.TextField(blank=True, null=True)
    
    url = models.TextField(blank=True, null=True)
    img = models.TextField(blank=True, null=True)
    def to_dict(job,type):
        # 将模型实例转换为字典
        job_dict = {
            'id':self.id,
            'name':self.name,
            'topic':str(self.topic),
            'topicTranslation':self.topicTranslation,
            'city':self.workcity,
            'cityTranslation':self.cityTranslation,
            'low_price':self.low_price,
            'high_price':self.high_price,
            'url':self.url,
            'img':self.img,
        }
        # 将字典转换为JSON字符串并返回
        return job_dict
    class Meta:
        managed = False
        verbose_name = '景区列表'
        db_table = 'travel'
class UserResume(models.Model):
    class Sex(models.TextChoices):
        男 = '1'
        女 = '0'
    id=models.BigAutoField(primary_key=True)
    user=models.OneToOneField('api.user', on_delete=models.CASCADE,null=True,blank=True)
    city1=models.IntegerField(verbose_name='期望城市id',default=0,null=True,blank=True)
    city1Translation=models.CharField(max_length=20, verbose_name='期望城市', null=True,blank=True)
    city2=models.IntegerField(verbose_name='期望城市2id',default=0,null=True,blank=True)
    city2Translation=models.CharField(max_length=20, verbose_name='期望城市2', null=True,blank=True)
    city3=models.IntegerField(verbose_name='期望城市3id',default=0,null=True,blank=True)
    city3Translation=models.CharField(max_length=20, verbose_name='期望城市3', null=True,blank=True)
    topic=models.BigIntegerField( verbose_name='期望景点类型编码',default=0, null=True,blank=True)
    topicTranslation=models.CharField(max_length=20, verbose_name='期望景点类型',default=0, null=True,blank=True)
    low_price=models.IntegerField(verbose_name='期望最低经费',default=0, null=True,blank=True)
    high_price=models.IntegerField(verbose_name='期望最高经费',default=100000, null=True,blank=True)

    
    
    created_time = models.DateTimeField(auto_now_add=True)  # 添加创建时间字段
    last_update = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')
    def to_dict(self):
        resume_data = {
            'id': self.id,
            'user_id': self.user.id,
            'name': self.user.name,
            'email':self.user.email,
            "phone":self.user.phone,
            'photo':'/media/'+str(self.user.photo),
            'birth': self.user.birth.strftime('%Y-%m-%d') if self.user.birth else '',
            'genderCode': str(self.user.genderCode).replace("None",""),
            'genderTranslation': self.user.genderTranslation,
            'city': str(self.city).replace("None",""),
            'city2': str(self.city2).replace("None",""),
            'city3': str(self.city3).replace("None",""),
            'topic': str(self.topic).replace("None",""),
            'topic_name': self.topic_name,
            'low_price': self.low_price,
            'high_price': self.high_price,
            'created_time': self.created_time.strftime('%Y-%m-%d %H:%M:%S'),
            'last_update': self.last_update.strftime('%Y-%m-%d %H:%M:%S'),
        }

        return resume_data
    class Meta:
        verbose_name = '用户画像信息'
        db_table = 'resume'
        verbose_name_plural = verbose_name

    
class user(AbstractUser):

    name=models.CharField(max_length=10, verbose_name='姓名',null=True)
    birth=models.DateField(verbose_name='生日',null=True)
    genderCode= models.IntegerField(  default='1', verbose_name='性别id 男 1 女 0',null=True)
    genderTranslation= models.CharField(max_length=2, default='男', verbose_name='性别',null=True)
    phone = models.CharField(max_length=11, verbose_name='手机号', null=False)
    photo = models.ImageField('头像', upload_to=user_directory_path, blank=True, null=True,default='default/user.jpg')
    init = models.BooleanField('初始化', blank=True, null=True,default=False)
    last_update = models.DateTimeField(auto_now=True, verbose_name='最后修改时间')    
    def __str__(self):
        return f'{self.username}'
    class Meta:
        verbose_name = '用户信息'
        db_table = 'user'
        verbose_name_plural = verbose_name


class Logs(models.Model):
    lid=models.BigAutoField(primary_key=True)
    user=models.ForeignKey(user, verbose_name="用户", on_delete=models.DO_NOTHING,null=True)
    active=models.TextField(verbose_name='行为')
    content=models.TextField(verbose_name='内容')
    create_time = models.DateTimeField(auto_now=False,auto_now_add=True, verbose_name='创建时间')
    class Meta:
        verbose_name = '操作日志'
        db_table = 'logs'
        verbose_name_plural = verbose_name
        
class Recommendforallusers(models.Model):
    user_id = models.IntegerField(primary_key=True)
    recommendations = models.TextField(blank=True, null=True)
    @property
    def recommend_job_list(self):
        
        return [i.get('job_id') for i in loads(self.recommendations)]
    class Meta:
        verbose_name = '用户推荐列表'
        managed = False
        db_table = 'recommendforallusers'
        
class StarJobs(models.Model):
    sid=models.BigAutoField(primary_key=True)
    user=models.ForeignKey('api.user', verbose_name="用户", on_delete=models.CASCADE)
    travel=models.ForeignKey('api.Travel', verbose_name="景点", on_delete=models.CASCADE)
    create_time = models.DateTimeField(auto_now=False,auto_now_add=True, verbose_name='创建时间')
    class Meta:
        verbose_name = '收藏列表'
        db_table = 'star'
        
class ClickJobs(models.Model):
    cid=models.BigAutoField(primary_key=True)
    user=models.ForeignKey('api.user', verbose_name="用户", on_delete=models.CASCADE)
    travel=models.ForeignKey('api.Travel', verbose_name="景点", on_delete=models.CASCADE)
    count=models.IntegerField(default=1)
    create_time = models.DateTimeField(auto_now=False,auto_now_add=True, verbose_name='创建时间')
    last_update = models.DateTimeField(auto_now=True,auto_now_add=False, verbose_name='最后修改时间')
    class Meta:
        verbose_name = '浏览列表'
        db_table = 'click'
class hot_TOP20(models.Model):
    id=models.IntegerField(primary_key=True)
    weight=models.IntegerField(null=True)
    class Meta:
        managed = False
        verbose_name = '景点热门列表'
        db_table = 'hot_top20'
@receiver(post_save, sender=user)
def createResume(sender, instance, **kwargs):
    resume=UserResume.objects.filter(user=instance)
    if not resume.exists():
        r=UserResume.objects.create(user=instance)
