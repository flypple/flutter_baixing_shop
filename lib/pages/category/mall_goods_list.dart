import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_baixing_shop/bean/mall_goods_bean.dart';
import 'package:flutter_baixing_shop/service/service_method.dart';
import 'package:flutter_baixing_shop/provide/category_provider.dart';
import 'package:flutter_baixing_shop/provide/mall_goods_provider.dart';
import 'package:flutter_baixing_shop/route/routes.dart';


class MallGoodsList extends StatelessWidget {

  GlobalKey<RefreshFooterState> _footerKey = GlobalKey();

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Provide<MallGoodsProvider>(
        builder: (context, child, provider){
          return getMallGoodsList(provider);
        }
    );
  }

  Widget getMallGoodsList(MallGoodsProvider provider) {
    Widget listWidget;
    if (provider.loading) {
      listWidget = Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    } else {
      if (provider.goodsList.isNotEmpty) {
        listWidget = Container(
          color: Colors.white,
          width: ScreenUtil().setWidth(570),
          child: EasyRefresh(
            refreshFooter: ClassicsFooter(
              key: _footerKey,
              bgColor: Colors.white,
              textColor: Colors.grey,
              loadText: "上拉加载",
              loadReadyText: "上拉加载",
              loadingText: "加载中……",
              noMoreText: "加载完毕",
              moreInfo: "加载时间 %T",
              moreInfoColor: Colors.grey,
              showMore: true,
              isFloat: false,
            ),
            loadMore: loadMore,
            onRefresh: loadData,
            child: GridView.count(
              childAspectRatio: provider.isListModel ? 2.5 : 1,
              crossAxisCount: provider.isListModel ? 1 : 2,
              mainAxisSpacing: provider.isListModel ? 0 : 8,
              children: provider.goodsList.map((item) {
                return _createItem(provider, item);
              }).toList(),
            ),
          ),
        );
      } else {
        listWidget = Container(
          child: Text("暂时没有数据…"),
        );
      }
    }
    return listWidget;
  }

  Widget _createItem(MallGoodsProvider provider, MallGoodsBean item){
    return InkWell(
      onTap: () {
        Routes.toGoodsDetailsPage(context, item.goodsId);
      },
      child: provider.isListModel
          ? _createListItem(item)
          : _createGridItem(item),
    );
  }

  Widget _createGridItem(MallGoodsBean item){
    return Container(
      width: ScreenUtil().setWidth(220),
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: <Widget>[
          Image.network(item.image, width: ScreenUtil().setWidth(160),),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              item.goodsName,
              style: TextStyle(color: Colors.black87, fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "价格:￥${item.presentPrice}",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 10
                ),
              ),
              Text(
                "￥${item.oriPrice}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  decoration: TextDecoration.lineThrough,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _createListItem(MallGoodsBean item){
    return Container(
      height: ScreenUtil().setHeight(220),
      padding: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
      child: Row(
        children: <Widget>[
          Image.network(item.image, width: ScreenUtil().setWidth(160),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    item.goodsName,
                    style: TextStyle(color: Colors.black87, fontSize: 12, height: 1.3),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  child: Text(
                    "价格:￥${item.presentPrice}",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 12,
                        height: 1.3
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "￥${item.oriPrice}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough,
                      height: 1.3
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadData() {
    var provider = getCategoryProvider(context);
    provider.pageIndex = 1;
    getGoodsList(
      categoryId: provider.categoryId,
      subCategoryId: provider.subCategoryId,
      page: provider.pageIndex,
    ).then((data){
      if (data != null) {
        provider.pageIndex++;
        getMallGoodsProvider(context).setData(data.data);
      }
    });
  }

  Future<void> loadMore() {
    var provider = getCategoryProvider(context);
    getGoodsList(
      categoryId : provider.categoryId,
      subCategoryId : provider.subCategoryId,
      page : provider.pageIndex,
    ).then((data,){
      if (data != null) {
        provider.pageIndex++;
        getMallGoodsProvider(context).addData(data.data);
        if (!getMallGoodsProvider(context).hasMore) {
          Fluttertoast.showToast(
            msg: "没有更多数据了……",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black54,
            fontSize: 12,
            textColor: Colors.white,
          );
        }
      }
    });
  }
}