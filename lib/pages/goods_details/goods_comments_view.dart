import 'package:flutter/material.dart';
import 'package:flutter_baixing_shop/bean/goods_details_result.dart';
import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsCommentsView extends StatelessWidget {
  final GoodsDetailsInfo info;

  const GoodsCommentsView({this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          getCommentsListView(),
          Image.network(info.advertesPicture.pICTUREADDRESS, width: ScreenUtil().setWidth(750),)
        ],
      ),
    );
  }

  Widget getCommentsListView() {
    return
      info.goodComments.isEmpty
        ? Container(
        height: ScreenUtil().setHeight(180),
        alignment: Alignment.center,
        child: Text("暂时没有评论"),
      )
        : Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: info.goodComments.length,
          itemBuilder: (context, index){
            var goodsComment = info.goodComments[index];
            var time = DateTime.fromMillisecondsSinceEpoch(goodsComment.discussTime).toLocal();
            String timeStr = "${time.year}-${time.month}-${time.day} ${time.hour}:${time.minute}:${time.second}";
            return Container(
              padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(goodsComment.userName, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12, height: 1.3),),
                  Text(goodsComment.comments, style: TextStyle(fontSize: 12, height: 1.2),),
                  Text(timeStr, style: TextStyle(color: Colors.grey, fontSize: 10, height: 1.3),),
                ],
              ),
            );
          },
        ),
      );
  }
}

class GoodsCommentsView2 extends StatelessWidget {
  final GoodsDetailsInfo info;

  const GoodsCommentsView2({this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          getCommentsListView(),
          Image.network(info.advertesPicture.pICTUREADDRESS, width: ScreenUtil().setWidth(750),)
        ],
      ),
    );
  }

  Widget getCommentsListView() {
    return
      info.goodComments.isEmpty
          ? Container(
        height: ScreenUtil().setHeight(180),
        alignment: Alignment.center,
        child: Text("暂时没有评论"),
      )
          : Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: info.goodComments.length,
          itemBuilder: (context, index){
            var goodsComment = info.goodComments[index];
            var time = DateTime.fromMillisecondsSinceEpoch(goodsComment.discussTime).toLocal();
            String timeStr = "${time.year}-${time.month}-${time.day} ${time.hour}:${time.minute}:${time.second}";
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(goodsComment.userName, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),),
                  Text(goodsComment.comments, style: TextStyle(fontSize: 12),),
                  Text(timeStr, style: TextStyle(color: Colors.grey, fontSize: 10),),
                ],
              ),
            );
          },
        ),
      );
  }
}
