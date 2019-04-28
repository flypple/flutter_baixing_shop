import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/pages/category/category_list_left.dart';
import 'package:flutter_baixing_shop/pages/category/category_list_right.dart';
import 'package:flutter_baixing_shop/provide/mall_goods_provider.dart';
import 'mall_goods_list.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("分类"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                getMallGoodsProvider(context).switchModel();
              },
              icon: Provide<MallGoodsProvider>(
                builder: (context, child, provider) {
                  return Icon(
                    provider.isListModel
                        ? Icons.border_all : Icons.menu,
                    color: Colors.white,
                  );
                },
              ),
            )
          ],
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              CategoryListLeft(),
              Column(
                children: <Widget>[
                  CategoryListRight(),
                  Expanded(
                    flex: 1,
                    child: MallGoodsList(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

