// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_details_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsDetailsResult _$GoodsDetailsResultFromJson(Map<String, dynamic> json) {
  return GoodsDetailsResult(
      json['code'] as String,
      json['message'] as String,
      json['data'] == null
          ? null
          : GoodsDetailsInfo.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GoodsDetailsResultToJson(GoodsDetailsResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };

GoodsDetailsInfo _$GoodsDetailsInfoFromJson(Map<String, dynamic> json) {
  return GoodsDetailsInfo(
      json['goodInfo'] == null
          ? null
          : GoodInfo.fromJson(json['goodInfo'] as Map<String, dynamic>),
      (json['goodComments'] as List)
          ?.map((e) => e == null
              ? null
              : GoodComments.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['advertesPicture'] == null
          ? null
          : AdvertesPicture.fromJson(
              json['advertesPicture'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GoodsDetailsInfoToJson(GoodsDetailsInfo instance) =>
    <String, dynamic>{
      'goodInfo': instance.goodInfo,
      'goodComments': instance.goodComments,
      'advertesPicture': instance.advertesPicture
    };

GoodInfo _$GoodInfoFromJson(Map<String, dynamic> json) {
  return GoodInfo(
      json['image5'] as String,
      json['amount'] as int,
      json['image3'] as String,
      json['image4'] as String,
      json['goodsId'] as String,
      json['isOnline'] as String,
      json['image1'] as String,
      json['image2'] as String,
      json['goodsSerialNumber'] as String,
      json['oriPrice'] as double,
      json['presentPrice'] as double,
      json['comPic'] as String,
      json['state'] as int,
      json['shopId'] as String,
      json['goodsName'] as String,
      json['goodsDetail'] as String);
}

Map<String, dynamic> _$GoodInfoToJson(GoodInfo instance) => <String, dynamic>{
      'image5': instance.image5,
      'amount': instance.amount,
      'image3': instance.image3,
      'image4': instance.image4,
      'goodsId': instance.goodsId,
      'isOnline': instance.isOnline,
      'image1': instance.image1,
      'image2': instance.image2,
      'goodsSerialNumber': instance.goodsSerialNumber,
      'oriPrice': instance.oriPrice,
      'presentPrice': instance.presentPrice,
      'comPic': instance.comPic,
      'state': instance.state,
      'shopId': instance.shopId,
      'goodsName': instance.goodsName,
      'goodsDetail': instance.goodsDetail
    };

GoodComments _$GoodCommentsFromJson(Map<String, dynamic> json) {
  return GoodComments(json['SCORE'] as int, json['comments'] as String,
      json['userName'] as String, json['discussTime'] as int);
}

Map<String, dynamic> _$GoodCommentsToJson(GoodComments instance) =>
    <String, dynamic>{
      'SCORE': instance.sCORE,
      'comments': instance.comments,
      'userName': instance.userName,
      'discussTime': instance.discussTime
    };

AdvertesPicture _$AdvertesPictureFromJson(Map<String, dynamic> json) {
  return AdvertesPicture(
      json['PICTURE_ADDRESS'] as String, json['TO_PLACE'] as String);
}

Map<String, dynamic> _$AdvertesPictureToJson(AdvertesPicture instance) =>
    <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE
    };
