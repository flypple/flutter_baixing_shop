import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryNavigator extends StatelessWidget {
  List categoryList;

  CategoryNavigator({Key key, this.categoryList}): super(key: key);

  Widget _createItem(item){
    return Container(
      padding: EdgeInsets.only(top: 3),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: (){
          print("点击了分类");
        },
        child: Column(
          children: <Widget>[
            Image.network(item["image"], width: ScreenUtil().setWidth(90), height: ScreenUtil().setHeight(90),),
            Text(item["mallCategoryName"], maxLines: 1,)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(310),
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(3),
      color: Colors.white,

      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: categoryList.map((item){
          return _createItem(item);
        }).toList(),
      ),
    );
  }
}
