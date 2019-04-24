import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_baixing_shop/bean/home_data_result.dart';

class CategoryNavigator extends StatelessWidget {
  List<Category> categoryList;

  CategoryNavigator({Key key, this.categoryList}): super(key: key);

  Widget _createItem(Category item){
    return Container(
      height: ScreenUtil().setHeight(150),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: (){
          print("点击了分类");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(item.image, width: ScreenUtil().setWidth(90), height: ScreenUtil().setHeight(90),),
            Text(item.mallCategoryName, maxLines: 1, style: TextStyle(fontSize: 10),)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(3, 6, 3, 9,),
      color: Colors.white,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        shrinkWrap: true,
        children: categoryList.map((item){
          return _createItem(item);
        }).toList(),
      ),
    );
  }
}
