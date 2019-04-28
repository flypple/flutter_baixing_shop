import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'cart_list_view.dart';
import 'cart_action_view.dart';
import 'empty_cart_view.dart';
import 'package:flutter_baixing_shop/provide/shopping_cart_provider.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("购物车"),
        ),
        body: Provide<ShoppingCartProvider>(
          builder: (context, child, provider) {
            return provider.shoppingList.length > 0
                ? cartView()
                : EmptyCartView();
          },
        ),
      ),
    );
  }

  Widget cartView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: CartListView(),
        ),
        CartActionView(),
      ],
    );
  }
}