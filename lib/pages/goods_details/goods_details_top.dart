import 'package:flutter/material.dart';
import 'package:flutter_baixing_shop/bean/goods_details_result.dart';
import 'package:flutter_baixing_shop/provide/goods_details_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class GoodsDetailsTop extends StatelessWidget {
  final GoodsDetailsProvider provider;

  const GoodsDetailsTop({this.provider});

  @override
  Widget build(BuildContext context) {
    GoodInfo info = provider.goodsDetailsInfo.goodInfo;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getHeadImage(info.image1),
          getGoodsNameView(info.goodsName),
          getSerialNumberView(info.goodsSerialNumber),
          getPricesView(info.presentPrice, info.oriPrice),
          getExplainView(),
        ],
      ),
    );
  }

  Widget getHeadImage(String image) {
    var setWidth = ScreenUtil().setWidth(750);
    return Container(
      width: setWidth,
      height: setWidth,
      child: Image.network(image,),
    );
  }

  Widget getGoodsNameView(String goodsName){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
      width: ScreenUtil().setWidth(750),
      child: Text(
        goodsName,
        style: TextStyle(fontSize: 16,),
      ),
    );
  }

  Widget getSerialNumberView(String serialNumber){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
      width: ScreenUtil().setWidth(750),
      child: Text(
        "编号：$serialNumber",
        style: TextStyle(fontSize: 14, color: Colors.grey,),
      ),
    );
  }

  Widget getPricesView(double presentPrice, double oriPrice){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          Text("￥$presentPrice", style: TextStyle(color: Colors.redAccent, fontSize: 18),),
          Text("￥$oriPrice", style: TextStyle(color: Colors.grey, fontSize: 14, decoration: TextDecoration.lineThrough),),
        ],
      ),
    );
  }

  Widget getExplainView(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: ScreenUtil().setWidth(750),
      child: Text(
        "说明：>极速送达>正品保证",
        style: TextStyle(fontSize: 14, color: Colors.deepOrangeAccent,),
      ),
    );
  }
}
