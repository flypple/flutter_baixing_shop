// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mall_goods_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MallGoodsResult _$MallGoodsResultFromJson(Map<String, dynamic> json) {
  return MallGoodsResult(
      json['code'] as String,
      json['message'] as String,
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : MallGoodsBean.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MallGoodsResultToJson(MallGoodsResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };

MallGoodsBean _$MallGoodsBeanFromJson(Map<String, dynamic> json) {
  return MallGoodsBean(
      json['image'] as String,
      (json['oriPrice'] as num)?.toDouble(),
      (json['presentPrice'] as num)?.toDouble(),
      json['goodsName'] as String,
      json['goodsId'] as String);
}

Map<String, dynamic> _$MallGoodsBeanToJson(MallGoodsBean instance) =>
    <String, dynamic>{
      'image': instance.image,
      'oriPrice': instance.oriPrice,
      'presentPrice': instance.presentPrice,
      'goodsName': instance.goodsName,
      'goodsId': instance.goodsId
    };
