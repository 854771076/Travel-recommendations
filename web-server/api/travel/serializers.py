from rest_framework import serializers
from api.models import Travel

class TravelSerializer(serializers.ModelSerializer):

    class Meta:
        model = Travel
        fields = '__all__'
class RecommendSerializer(serializers.Serializer):
    pagesize=serializers.IntegerField(max_value=10,min_value=1,default=5)
    page=serializers.IntegerField(max_value=10,min_value=1,default=1)
class CollectSerializer(serializers.Serializer):
    id=serializers.CharField()
class ClickSerializer(serializers.Serializer):
    id=serializers.CharField()
    