import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/provide/shopping_cart_provider.dart';
import 'cart_item_view.dart';

class CartListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<ShoppingCartProvider>(
        builder: (context, child, provide) {
          return ListView.builder(
            itemCount: provide.shoppingList.length,
            itemBuilder: (context, index) {
              return CartItemView(shoppingInfo: provide.shoppingList[index],);
            },
          );
        },
      ),
    );
  }
}
