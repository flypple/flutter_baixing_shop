class ShoppingInfo {
  String goodsId;
  String goodsName;
  String image;
  double price;
  int count;
  bool isChecked;

  ShoppingInfo({this.goodsId, this.goodsName, this.image, this.price, this.count, this.isChecked = true});

  ShoppingInfo.fromJson(Map<String, dynamic> json) {
    goodsId = json["goodsId"];
    goodsName = json["goodsName"];
    image = json["image"];
    price = json["price"];
    count = json["count"];
    isChecked = json["isChecked"] == null ? false : json["isChecked"];
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["goodsId"] = goodsId;
    map["goodsName"] = goodsName;
    map["image"] = image;
    map["price"] = price;
    map["count"] = count;
    map["isChecked"] = isChecked;
    return map;
  }
}