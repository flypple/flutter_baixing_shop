// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryBean _$CategoryBeanFromJson(Map<String, dynamic> json) {
  return CategoryBean(
      json['code'] as String,
      json['message'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CategoryBeanToJson(CategoryBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['mallCategoryId'] as String,
      json['mallCategoryName'] as String,
      (json['bxMallSubDto'] as List)
          ?.map((e) => e == null
              ? null
              : BxMallSubDto.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['image'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'mallCategoryId': instance.mallCategoryId,
      'mallCategoryName': instance.mallCategoryName,
      'bxMallSubDto': instance.bxMallSubDto,
      'image': instance.image
    };

BxMallSubDto _$BxMallSubDtoFromJson(Map<String, dynamic> json) {
  return BxMallSubDto(
      json['mallSubId'] as String,
      json['mallCategoryId'] as String,
      json['mallSubName'] as String,
      json['comments'] as String);
}

Map<String, dynamic> _$BxMallSubDtoToJson(BxMallSubDto instance) =>
    <String, dynamic>{
      'mallSubId': instance.mallSubId,
      'mallCategoryId': instance.mallCategoryId,
      'mallSubName': instance.mallSubName,
      'comments': instance.comments
    };
