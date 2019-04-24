import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_baixing_shop/route/routes.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_baixing_shop/bean/home_data_result.dart';

class RecommendList extends StatelessWidget {
  final List<Recommend> recommentList;

  const RecommendList({Key key, this.recommentList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommentList.length,
        itemBuilder: (context, index){
          return _createItem(context, index);
        }
      ),
    );
  }

  Widget _createItem(context, index){
    var item = recommentList[index];

    return InkWell(
      onTap: (){
        print("点击商品${item.goodsId}");
        Routes.toGoodsDetailsPage(context, item.goodsId);
      },
      child: Container(
        width: ScreenUtil().setWidth(250),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(right: BorderSide(color: Colors.black12, width: 1),)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(item.image),
            Text("￥${item.mallPrice}"),
            Text("￥${item.price}", style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough, fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
