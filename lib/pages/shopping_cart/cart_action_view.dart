import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/provide/shopping_cart_provider.dart';

class CartActionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.white,
      child: Provide<ShoppingCartProvider>(
        builder: (context, child, provider) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              checkBox(provider),
              Container(
                child: Text("全选",),
              ),
              summation(provider),
              doOrder(provider)
            ],
          );
        },
      ),
    );
  }

  Widget doOrder(ShoppingCartProvider provider) {
    return Container(
      width: ScreenUtil().setWidth(150),
      margin: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: Colors.pinkAccent,
      ),
      child: Text(
        "结算(${provider.totalCount})",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget summation(ShoppingCartProvider provider) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        margin:  EdgeInsets.only(right: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("合计："),
                Text(
                  "￥${provider.totalPrice}",
                  style: TextStyle(
                    color: Colors.pinkAccent
                  ),
                )
              ],
            ),
            Text("满10元免配送费，预购免配送费", style: TextStyle(fontSize: 10, height: 1.4),)
          ],
        ),
      ),
    );
  }

  Widget checkBox(ShoppingCartProvider provider) {
    return Container(
      child: Checkbox(
        activeColor: Colors.pinkAccent,
        value: provider.isAllChecked,
        onChanged: (value) {
          provider.checkAll(value);
        },
      ),
    );
  }
}
