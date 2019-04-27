import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_baixing_shop/provide/index_provider.dart';

class EmptyCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Icon(
              CupertinoIcons.shopping_cart,
              color: Colors.white,
              size: 46,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 24),
            child: Text(
              "购物车还空着，快去挑选商品吧",
              style: TextStyle(
                  color: Colors.grey
              ),
            ),
          ),
          InkWell(
            onTap: () {
              IndexProvider.getProvider(context).changeIndex(0);
            },
            child: Container(
              width: 160,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text("去逛逛", style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
