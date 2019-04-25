import 'package:flutter/material.dart';
import 'package:flutter_baixing_shop/constants.dart';

import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_baixing_shop/bean/mall_goods_bean.dart';

class MallGoodsProvider with ChangeNotifier {

  List<MallGoodsBean> goodsList = [];
  bool loading = true;
  bool hasMore = false;

  bool isListModel = true;

  void setData(List<MallGoodsBean> list) {
    loading = false;
    goodsList.clear();
    if (list != null) {
      goodsList.addAll(list);
    }
    notifyListeners();
  }

  void addData(List<MallGoodsBean> list){
    hasMore = list != null;
    if (hasMore) {
      goodsList.addAll(list);
    }
    notifyListeners();
  }

  void clear() {
    loading = true;
    goodsList.clear();
    notifyListeners();
  }

  void switchModel() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    bool success = await instance.setBool(Constants.isListType, !isListModel);
    if (success) {
      isListModel = !isListModel;
      notifyListeners();
    }
  }

  void getModules() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    bool isList = instance.getBool(Constants.isListType);
    if (isList != null) {
      isListModel = isList;
    }
    notifyListeners();
  }
}

MallGoodsProvider getMallGoodsProvider(BuildContext context) {
  return Provide.value<MallGoodsProvider>(context);
}