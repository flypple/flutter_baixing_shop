class ShoppingInfo {
  String goodsId;
  String goodsName;
  String image;
  double price;
  int count;

  ShoppingInfo({this.goodsId, this.goodsName, this.image, this.price, this.count});

  ShoppingInfo.fromJson(Map<String, dynamic> json) {
    goodsId = json["goodsId"];
    goodsName = json["goodsName"];
    image = json["image"];
    price = json["price"];
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["goodsId"] = goodsId;
    map["goodsName"] = goodsName;
    map["image"] = image;
    map["price"] = price;
    map["count"] = count;
    return map;
  }
}