import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_baixing_shop/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/bean/shopping_info.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<ShoppingInfo> shoppingList = new List();
  double totalPrice = 0;
  int totalCount = 0;
  bool isAllChecked = false;

  /// 添加一件商品到购物车
  void addShopping(String goodsId, String goodsName, String image, double price, int count, bool isChecked) async {

    bool has = false;
    //查找，如果找到，数量+1
    for (var item in shoppingList) {
      if (goodsId == item.goodsId) {
        item.count += count;
        has = true;
      }
    }

    //如果没找到，则新建一个商品对象，添加到购物车。
    if (!has) {
      var shoppingInfo = ShoppingInfo(
        goodsId: goodsId,
        goodsName: goodsName,
        image: image,
        price: price,
        count: count,
        isChecked: isChecked,
      );
      //添加到购物车中
      shoppingList.add(shoppingInfo);
    }

    _doAfterChange();
  }

  ///删除一个商品
  void deleteShopping(ShoppingInfo info) async {
    if (shoppingList.contains(info)) {
      shoppingList.remove(info);

      _doAfterChange();
    }
  }

  /// 增加一件商品的数量
  void add(ShoppingInfo info) async {
    if (shoppingList.contains(info)) {
      info.count ++;

      _doAfterChange();
    }
  }

  /// 减少一件商品的数量
  void sub(ShoppingInfo info) async {
    if (shoppingList.contains(info)) {
      if (info.count > 1) {
        info.count --;

        _doAfterChange();
      }
    }
  }

  ///清空购物车
  void clearShoppingCart() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(Constants.shoppingData);
    shoppingList.clear();
    _doAfterChange();
  }

  void checkAll(bool checkAll) {
    isAllChecked = checkAll;
    for (var value in shoppingList) {
      value.isChecked = isAllChecked;
    }

    _doAfterChange();
  }

  void changeItemCheckedState(ShoppingInfo info) {
    if (shoppingList.contains(info)) {
      info.isChecked = !info.isChecked;
    }
    _doAfterChange();
  }

  /// 获取购物车数据
  void getShoppingCart() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String data = sp.getString(Constants.shoppingData);
    var temp = data == null ? [] : jsonDecode(data);
    List tempList = (temp as List).cast();
    shoppingList.clear();
    tempList.forEach((item){
      var shoppingInfo = ShoppingInfo.fromJson(item);
      shoppingList.add(shoppingInfo);
    });

    _doAfterChange();
  }

  /// 统一的在商品数据变化后的操作
  void _doAfterChange() async {
    //计算
    calculate();

    //存储购物车数据
    _saveShoppingList();

    notifyListeners();
  }

  /// 存储购物车数据
  void _saveShoppingList() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String data = jsonEncode(await _shoppingListToJson(shoppingList));
    print("购物车数据 ======> 总数量 = $totalCount ---- 总价格 = $totalPrice ---- $data");
    sp.setString(Constants.shoppingData, data);
  }

  /// 购物车数据转换
  Future<List<Map>> _shoppingListToJson(List<ShoppingInfo> list) async {
    List<Map> tempList = [];
    if (list != null) {
      for (var value in list) {
        tempList.add(value.toJson());
      }
    }
    return tempList;
  }

  /// 计算
  void calculate() {
    double price = 0;
    int count = 0;
    int checkedCount = 0;
    for (var value in shoppingList) {
      count += value.isChecked ? value.count : 0;
      price += value.isChecked ? value.count * value.price : 0;
      checkedCount += value.isChecked ? 1 : 0;
    }
    totalPrice = price;
    totalCount = count;
    if (checkedCount == 0) {
      isAllChecked = false;
    } else if (checkedCount == shoppingList.length) {
      isAllChecked = true;
    }
  }

  static ShoppingCartProvider getProvider(BuildContext context) {
    return Provide.value<ShoppingCartProvider>(context);
  }
}