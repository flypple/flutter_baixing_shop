import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/bean/home_data_result.dart';
import 'package:flutter_baixing_shop/bean/hot_goods_result.dart';

class HomeDataProvider with ChangeNotifier {
  HomeData homeData;
  List<HotGoods> hotGoodsList = [];

  void setHomeData(HomeData homeData) {
    this.homeData = homeData;
    if (homeData.category.length > 10) {
      homeData.category.removeRange(10, homeData.category.length);
    }
    notifyListeners();
  }

  void addHotGoods(List<HotGoods> hotGoodsList) {
    this.hotGoodsList.addAll(hotGoodsList);
    notifyListeners();
  }

  static HomeDataProvider getProvider(BuildContext context) {
    return Provide.value<HomeDataProvider>(context);
  }
}