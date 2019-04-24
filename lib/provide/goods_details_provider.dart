import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/bean/goods_details_result.dart';

class GoodsDetailsProvider with ChangeNotifier {
  GoodsDetailsInfo goodsDetailsInfo;
  String goodsId;

  int tabPosition;

  void setGoodsDetailsInfo(GoodsDetailsInfo info){
     goodsDetailsInfo = info;
     goodsId = info.goodInfo.goodsId;
     tabPosition = 0;
     notifyListeners();
  }

  void setTabPosition(int index){
    tabPosition = index;
    notifyListeners();
  }

  static GoodsDetailsProvider getProvider(BuildContext context){
    return Provide.value<GoodsDetailsProvider>(context);
  }
}