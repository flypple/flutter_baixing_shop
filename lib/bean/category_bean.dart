import 'package:json_annotation/json_annotation.dart';

part 'category_bean.g.dart';

@JsonSerializable()
class CategoryResult {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<CategoryBean> data;

  CategoryResult(this.code,this.message,this.data,);

  factory CategoryResult.fromJson(Map<String, dynamic> srcJson) => _$CategoryResultFromJson(srcJson);
}


@JsonSerializable()
class CategoryBean {

  @JsonKey(name: 'mallCategoryId')
  String mallCategoryId;

  @JsonKey(name: 'mallCategoryName')
  String mallCategoryName;

  @JsonKey(name: 'bxMallSubDto')
  List<BxMallSubDto> bxMallSubDto;

  @JsonKey(name: 'image')
  String image;

  CategoryBean(this.mallCategoryId,this.mallCategoryName,this.bxMallSubDto,this.image,);

  factory CategoryBean.fromJson(Map<String, dynamic> srcJson) => _$CategoryBeanFromJson(srcJson);

}


@JsonSerializable()
class BxMallSubDto {

  @JsonKey(name: 'mallSubId')
  String mallSubId;

  @JsonKey(name: 'mallCategoryId')
  String mallCategoryId;

  @JsonKey(name: 'mallSubName')
  String mallSubName;

  @JsonKey(name: 'comments')
  String comments;

  BxMallSubDto(this.mallSubId,this.mallCategoryId,this.mallSubName,this.comments,);

  factory BxMallSubDto.fromJson(Map<String, dynamic> srcJson) => _$BxMallSubDtoFromJson(srcJson);

}