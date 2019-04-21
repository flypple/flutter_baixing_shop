import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/bean/category_bean.dart';
import 'package:flutter_baixing_shop/service/service_method.dart';
import 'package:flutter_baixing_shop/pages/category/category_list_left.dart';
import 'package:flutter_baixing_shop/pages/category/category_list_right.dart';
import 'package:flutter_baixing_shop/provide/category_provider.dart';
import 'package:flutter_baixing_shop/provide/mall_goods_provider.dart';
import 'mall_goods_list.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("分类"),
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

