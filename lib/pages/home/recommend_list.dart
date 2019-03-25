import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendList extends StatelessWidget {
  final List<Map> recommentList;

  const RecommendList({Key key, this.recommentList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommentList.length,
        itemBuilder: (context, index){
          return _createItem(index);
        }
      ),
    );
  }

  Widget _createItem(index){
    var item = recommentList[index];
    return Container(
      height: ScreenUtil().setHeight(330),
      width: ScreenUtil().setWidth(250),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Colors.black12, width: 1),)
      ),
      child: Column(
        children: <Widget>[
          Image.network(item["image"]),
          Text(item["mallPrice"].toString()),
          Text(item["price"].toString(), style: TextStyle(color: Colors.grey,),),
        ],
      ),
    );
  }
}
