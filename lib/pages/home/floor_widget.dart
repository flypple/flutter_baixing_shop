import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorWidget extends StatelessWidget {

  final Map titleData;
  final List<Map> dataList;

  const FloorWidget({Key key, this.titleData, this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FloorTitle(data: titleData,),
          FloorBody(dataList: dataList,),
        ],
      ),
    );
  }
}

class FloorTitle extends StatelessWidget {
  final Map data;

  const FloorTitle({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: InkWell(
        child: Image.network(data["PICTURE_ADDRESS"]),
      ),
    );
  }
}

class FloorBody extends StatelessWidget {

  final List<Map> dataList;

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
  final Map data;

  const FloorItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        child: Image.network(data["image"]),
      ),
    );
  }
}
