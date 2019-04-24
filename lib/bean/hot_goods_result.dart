import 'package:json_annotation/json_annotation.dart';

part 'hot_goods_result.g.dart';


@JsonSerializable()
class HotGoodsResult extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<HotGoods> data;

  HotGoodsResult(this.code,this.message,this.data,);

  factory HotGoodsResult.fromJson(Map<String, dynamic> srcJson) => _$HotGoodsResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotGoodsResultToJson(this);

}


@JsonSerializable()
class HotGoods extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'mallPrice')
  double mallPrice;

  @JsonKey(name: 'goodsId')
  String goodsId;

  @JsonKey(name: 'price')
  double price;

  HotGoods(this.name,this.image,this.mallPrice,this.goodsId,this.price,);

  factory HotGoods.fromJson(Map<String, dynamic> srcJson) => _$HotGoodsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotGoodsToJson(this);

}