import 'package:flutter/material.dart';

import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_baixing_shop/pages/index_page.dart';
import 'package:flutter_baixing_shop/provide/counter.dart';
import 'provide/category_provider.dart';
import 'provide/mall_goods_provider.dart';

void main() {
  var counter = Counter();
  var categoryProvider = CategoryProvider();
  var providers = Providers()
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<CategoryProvider>.value(categoryProvider))
    ..provide(Provider<MallGoodsProvider>.value(MallGoodsProvider()));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: IndexPage(),
      ),
    );
  }
}