// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_goods_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotGoodsResult _$HotGoodsResultFromJson(Map<String, dynamic> json) {
  return HotGoodsResult(
      json['code'] as String,
      json['message'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : HotGoods.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HotGoodsResultToJson(HotGoodsResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };

HotGoods _$HotGoodsFromJson(Map<String, dynamic> json) {
  return HotGoods(
      json['name'] as String,
      json['image'] as String,
      (json['mallPrice'] as num)?.toDouble(),
      json['goodsId'] as String,
      (json['price'] as num)?.toDouble());
}

Map<String, dynamic> _$HotGoodsToJson(HotGoods instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'mallPrice': instance.mallPrice,
      'goodsId': instance.goodsId,
      'price': instance.price
    };
