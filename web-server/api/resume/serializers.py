from rest_framework import serializers
from api.models import UserResume,user

class UserResumeSerializer(serializers.ModelSerializer):
    # salesman_username = serializers.ReadOnlyField(source='salesman.username')

    class Meta:
        model = UserResume
        fields = '__all__'
class PhotoSerializer(serializers.ModelSerializer):
    
    file=serializers.FileField(required=True, source='photo')
    class Meta:
        model=user
        fields = ['file']
        extra_kwargs = {
            'file': {'required': True}
        }
class baseinfoSerializer(serializers.ModelSerializer):
    name = serializers.CharField(allow_blank=True)
    birth = serializers.DateField(allow_null=True)
    genderCode = serializers.IntegerField(allow_null=True,default=0)
    genderTranslation = serializers.CharField(allow_blank=True)

    class Meta:
        model=user
        fields = ['name','birth','genderCode','genderTranslation']
class resumeinfoSerializer(serializers.ModelSerializer):

    class Meta:
        model=UserResume
        exclude =['id','user']
