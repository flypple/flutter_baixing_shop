import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_baixing_shop/bean/hot_goods_result.dart';

import 'package:flutter_baixing_shop/route/routes.dart';

class HotGoodsListView extends StatelessWidget {

  final List<HotGoods> goodsList;

  const HotGoodsListView({Key key, this.goodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _getTitle(),
          _getGoodsWidgetList(context),
        ],
      ),
    );
  }
  
  Widget _getTitle() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text("火爆专区"),
    );
  }
  
  Widget _getGoodsWidgetList(BuildContext context){
    List<Widget> widgetList = goodsList.map((item){
      return InkWell(
        onTap: (){
          Routes.toGoodsDetailsPage(context, item.goodsId);
        },
        child: Container(
          width: ScreenUtil().setWidth(370),
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(item.image, width: ScreenUtil().setWidth(370),),
              Text(
                item.name,
                style: TextStyle(color: Colors.pinkAccent, fontSize: ScreenUtil().setSp(26)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("￥${item.mallPrice}", style: TextStyle(fontSize: ScreenUtil().setSp(26)),),
                  ),
                  Expanded(
                    child: Text(
                      "￥${item.price}",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(26),
                        color: Colors.grey,
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();
    return Container(
      child: Wrap(
        spacing: 3,
        runSpacing: 3,
        children: widgetList,
      ),
    );
  }
}
