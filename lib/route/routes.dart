import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluro/fluro.dart';
import 'package:flutter_baixing_shop/pages/goods_details/goods_details_page.dart';

class Routes {
  static final router = Router();

  static final String detailsPage = "/detailsPage/:data";

  static void initRoutes() {
    router.define(
      detailsPage,
      handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params){
          return GoodsDetailsPage(params["data"][0]);
        }
      )
    );
  }

  static void toGoodsDetailsPage(BuildContext context, String goodsId){
    router.navigateTo(context, "/detailsPage/$goodsId", transition: TransitionType.inFromRight);
  }
}