import 'package:flutter/material.dart';

import 'package:flutter_baixing_shop/provide/shopping_cart_provider.dart';
import 'package:flutter_baixing_shop/provide/goods_details_provider.dart';

class GoodsActionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: Icon(Icons.shopping_cart, color: Colors.pinkAccent,),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {
                var info = GoodsDetailsProvider.getProvider(context).goodsDetailsInfo.goodInfo;
                ShoppingCartProvider.getProvider(context).addShopping(
                  info.goodsId, info.goodsName, info.image1, info.presentPrice, 1,
                );
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.green,
                child: Text("加入购物车", style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                color: Colors.deepOrange,
                child: Text("立即购买", style: TextStyle(color: Colors.white,),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
