import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:flutter_baixing_shop/pages/home/floor_widget.dart';
import 'package:flutter_baixing_shop/pages/home/hot_goods.dart';
import 'package:flutter_baixing_shop/service/service_method.dart';
import 'package:flutter_baixing_shop/global_config.dart';
import 'my_swiper.dart';
import 'category_navigator.dart';
import 'ad_banner.dart';
import 'call_phone_widget.dart';
import 'recommend_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _textController = TextEditingController();
  String result = "";

  List<Map> goodsList = [];
  int pages = 0;

  GlobalKey<RefreshFooterState> _footerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("HomePage ====> building……");
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("首页"),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot){
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString())["data"];
              List<Map> images = (data["slides"] as List).cast();
              List categoryList = (data["category"] as List).cast();
              categoryList.removeRange(10, categoryList.length);

              String adImage = data["advertesPicture"]["PICTURE_ADDRESS"];

              String leaderImage = data["shopInfo"]["leaderImage"];
              String leaderPhone = data["shopInfo"]["leaderPhone"];
              List<Map> recommendList = (data["recommend"] as List).cast();
              Map floor1Data = data["floor1Pic"];
              Map floor2Data = data["floor2Pic"];
              Map floor3Data = data["floor3Pic"];
              List<Map> floor1DataList = (data["floor1"] as List).cast();
              List<Map> floor2DataList = (data["floor2"] as List).cast();
              List<Map> floor3DataList = (data["floor3"] as List).cast();

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
                  loadMore: loadMore,
                  child: ListView(
                    children: <Widget>[
                      //轮播图
                      MySwiper(images: images,),
                      //分类
                      CategoryNavigator(categoryList: categoryList,),
                      //广告banner
                      AdBanner(bannerImage: adImage,),
                      //打电话
                      CallPhoneWidget(image: leaderImage, phone: leaderPhone,),
                      //商品推荐
                      _createRecommend(recommendList),
                      //楼层组件
                      FloorWidget(titleData: floor1Data, dataList: floor1DataList,),
                      FloorWidget(titleData: floor2Data, dataList: floor2DataList,),
                      FloorWidget(titleData: floor3Data, dataList: floor3DataList,),
                      //热卖专区
                      HotGoods(goodsList: goodsList,),
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
        ),
      ),
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

  Future loadMore() async {
    return await getHomePageBelowConten(pages).then((value){
      var map = jsonDecode(value);
      var list = (map["data"] as List).cast<Map>();
      setState(() {
        goodsList.addAll(list);
        pages++;
      });
    });
  }
}
