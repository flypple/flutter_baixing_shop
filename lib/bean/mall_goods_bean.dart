import 'package:json_annotation/json_annotation.dart';

part 'mall_goods_bean.g.dart';


@JsonSerializable()
class MallGoodsResult {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<MallGoodsBean> data;

  MallGoodsResult(this.code,this.message,this.data,);

  factory MallGoodsResult.fromJson(Map<String, dynamic> srcJson) => _$MallGoodsResultFromJson(srcJson);

}


@JsonSerializable()
class MallGoodsBean {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'oriPrice')
  double oriPrice;

  @JsonKey(name: 'presentPrice')
  double presentPrice;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'goodsId')
  String goodsId;

  MallGoodsBean(this.image,this.oriPrice,this.presentPrice,this.goodsName,this.goodsId,);

  factory MallGoodsBean.fromJson(Map<String, dynamic> srcJson) => _$MallGoodsBeanFromJson(srcJson);

}


