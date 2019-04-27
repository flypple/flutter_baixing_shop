import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/provide/shopping_cart_provider.dart';
import 'package:flutter_baixing_shop/provide/goods_details_provider.dart';
import 'package:flutter_baixing_shop/provide/index_provider.dart';

class GoodsActionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {
                IndexProvider.getProvider(context).changeIndex(2);
                Navigator.of(context).pop();
              },
              child: cartViewWithDot(),
            ),
          ),
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {
                var info = GoodsDetailsProvider.getProvider(context).goodsDetailsInfo.goodInfo;
                ShoppingCartProvider.getProvider(context).addShopping(
                  info.goodsId, info.goodsName, info.image1, info.presentPrice, 1, true
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
            flex: 5,
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

  Container cartView() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Icon(Icons.shopping_cart, color: Colors.pinkAccent, size: 28,),
    );
  }

  Widget cartViewWithDot() {
    return Provide<ShoppingCartProvider>(
      builder: (context, child, provider){
        Widget widget;
        if (provider.totalCount > 0) {
          widget = Stack(
            children: <Widget>[
              cartView(),
              countDot(provider),
            ],
          );
        } else {
          widget = cartView();
        }
        return widget;
      },
    );
  }

  Widget countDot(provider){
    return Positioned(
      top: 5,
      right: 8,
      child: Container(
        width: 16,
        height: 16,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text("${provider.totalCount}", style: TextStyle(color: Colors.white, fontSize: 11),),
      ),
    );
  }
}
