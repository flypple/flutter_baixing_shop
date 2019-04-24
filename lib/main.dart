import 'package:flutter/material.dart';
import 'package:flutter_baixing_shop/route/routes.dart';

import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_baixing_shop/pages/index_page.dart';
import 'package:flutter_baixing_shop/provide/counter.dart';
import 'provide/category_provider.dart';
import 'provide/mall_goods_provider.dart';
import 'provide/goods_details_provider.dart';

void main() {
  var providers = Providers()
    ..provide(Provider<Counter>.value(Counter()))
    ..provide(Provider<CategoryProvider>.value(CategoryProvider()))
    ..provide(Provider<MallGoodsProvider>.value(MallGoodsProvider()))
    ..provide(Provider<GoodsDetailsProvider>.value(GoodsDetailsProvider()));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //初始化路由
    Routes.initRoutes();
    return Container(
      child: MaterialApp(
        onGenerateRoute: Routes.router.generator,
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