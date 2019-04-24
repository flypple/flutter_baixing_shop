import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_baixing_shop/bean/home_data_result.dart';
import 'package:flutter_baixing_shop/route/routes.dart';

class FloorWidget extends StatelessWidget {

  final Floor1Pic floor;
  final List<Floor1> floorPicList;

  const FloorWidget({Key key, this.floor, this.floorPicList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FloorTitle(data: floor,),
          FloorBody(dataList: floorPicList,),
        ],
      ),
    );
  }
}

class FloorTitle extends StatelessWidget {
  final Floor1Pic data;

  const FloorTitle({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: InkWell(
        child: Image.network(data.pICTUREADDRESS),
      ),
    );
  }
}

class FloorBody extends StatelessWidget {

  final List<Floor1> dataList;

  const FloorBody({Key key, this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              FloorItem(data: dataList[0],),
              Column(
                children: <Widget>[
                  FloorItem(data: dataList[1],),
                  FloorItem(data: dataList[2],),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              FloorItem(data: dataList[3],),
              FloorItem(data: dataList[4],),
            ],
          )
        ],
      ),
    );
  }
}

class FloorItem extends StatelessWidget {
  final Floor1 data;

  const FloorItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          Routes.toGoodsDetailsPage(context, data.goodsId);
        },
        child: Image.network(data.image),
      ),
    );
  }
}
