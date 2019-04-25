import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_baixing_shop/provide/goods_details_provider.dart';
import 'package:provide/provide.dart';
import 'package:flutter_baixing_shop/service/service_method.dart';
import 'package:flutter_baixing_shop/bean/goods_details_result.dart';
import 'goods_details_top.dart';
import 'goods_details_tab.dart';
import 'goods_action_view.dart';

class GoodsDetailsPage extends StatelessWidget {
  final String goodsId;

  GoodsDetailsPage(this.goodsId,);

  AppBar appBar;

  @override
  Widget build(BuildContext context) {
    print("goodsId ====== $goodsId");
    var detailsInfo = GoodsDetailsProvider.getProvider(context).goodsDetailsInfo;
    if (detailsInfo == null || goodsId != detailsInfo.goodInfo.goodsId) {
      getGoodsDetais(goodsId).then((data){
        GoodsDetailsProvider.getProvider(context).setGoodsDetailsInfo(data.data);
      });
    }

    appBar = AppBar(
      leading: IconButton(
        icon: Icon(CupertinoIcons.back),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
      title: Text("商品详情"),
    );
    return Container(
      child: Scaffold(
        appBar: appBar,
        body: Provide<GoodsDetailsProvider>(
          builder: (context, child, provider){
            GoodsDetailsInfo info = provider.goodsDetailsInfo;
            Widget widget;
            if (info != null && goodsId == info.goodInfo.goodsId) {
              widget = getContentView(context, provider);
            } else {
              widget = getLoadingView();
            }
            return widget;
          },
        ),
      ),
    );
  }

  Widget getContentView(BuildContext context, GoodsDetailsProvider provider) {
    var queryData = MediaQuery.of(context);
    print("queryData.size.height ============> ${queryData.size.height}");
//    double height = queryData.size.height - queryData.padding.top - appBar.preferredSize.height;
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black12,
            child: ListView(
              children: <Widget>[
                GoodsDetailsTop(provider: provider,),
                GoodsDetailsTab(provider: provider,),
//          GoodsDetailsTab2(provider: provider, height: height),
              ],
            ),
          ),
        ),
        GoodsActionView(),
      ],
    );
  }

  Widget getLoadingView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

