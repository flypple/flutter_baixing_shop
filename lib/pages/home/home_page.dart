import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/pages/home/floor_widget.dart';
import 'package:flutter_baixing_shop/pages/home/hot_goods.dart';
import 'package:flutter_baixing_shop/service/service_method.dart';
import 'package:flutter_baixing_shop/config/global_config.dart';
import 'my_swiper.dart';
import 'category_navigator.dart';
import 'ad_banner.dart';
import 'call_phone_widget.dart';
import 'recommend_list.dart';
import 'package:flutter_baixing_shop/provide/home_data_provider.dart';

class HomePage extends StatelessWidget {

  String result = "";

  List<Map> goodsList = [];
  int pages = 0;

  GlobalKey<RefreshFooterState> _footerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print("HomePage ====> building……");
    loadHomeData(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("首页"),
          elevation: 0,
        ),
        body: _createBody(),
      ),
    );
  }

  Widget _createBody(){
    return Provide<HomeDataProvider>(
      builder: (context, child, provider){
        if (provider.homeData != null) {
          var homeData = provider.homeData;

          return Container(
            color: GlobalConfig.backgrondColor,
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
              loadMore: (){
                loadMore(context);
              },
              child: ListView(
                children: <Widget>[
                  //轮播图
                  MySwiper(slideList: homeData.slides,),
                  //分类
                  CategoryNavigator(categoryList: homeData.category,),
                  //广告banner
                  AdBanner(advertes: homeData.advertesPicture,),
                  //打电话
                  CallPhoneWidget(shopInfo: homeData.shopInfo,),
                  //商品推荐
                  _createRecommend(homeData.recommend),
                  //楼层组件
                  FloorWidget(floor: homeData.floor1Pic, floorPicList: homeData.floor1,),
                  FloorWidget(floor: homeData.floor2Pic, floorPicList: homeData.floor2,),
                  FloorWidget(floor: homeData.floor3Pic, floorPicList: homeData.floor3,),
                  //热卖专区
                  HotGoodsListView(goodsList: provider.hotGoodsList,),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _createRecommend(recommendList) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 3, 3, 5),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.black12, width: 1))
            ),
            child: Text("商品推荐", style: TextStyle(color: Colors.pinkAccent),),
          ),
          RecommendList(recommentList: recommendList,),
        ],
      ),
    );
  }

  void loadHomeData(BuildContext context){
    getHomePageContent().then((value){
      HomeDataProvider.getProvider(context).setHomeData(value.data);
    });
  }

  void loadMore(BuildContext context) async {
    getHomePageBelowConten(pages).then((value){
      HomeDataProvider.getProvider(context).addHotGoods(value.data);
    });
  }
}
