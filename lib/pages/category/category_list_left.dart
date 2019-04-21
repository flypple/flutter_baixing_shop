import 'package:flutter/material.dart';
import 'package:flutter_baixing_shop/provide/mall_goods_provider.dart';
import 'package:flutter_baixing_shop/service/service_method.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_baixing_shop/provide/category_provider.dart';

class CategoryListLeft extends StatefulWidget {
  
  @override
  _CategoryListLeftState createState() => _CategoryListLeftState();
}

class _CategoryListLeftState extends State<CategoryListLeft> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    getCategory().then((value){
      setState(() {
        var firstItem = value.data[0];
        getCategoryProvider(context).setCategoryList(value.data);
        //获取默认显示的小类的数据。
        loadGoodsList();
      });
    });
  }

  void loadGoodsList(){
    var provider = getMallGoodsProvider(context);
    provider.clear();
    getGoodsList(categoryId: getCategoryProvider(context).categoryId,).then((value) {
      getMallGoodsProvider(context).setData(value.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.black26, width: 1)
        )
      ),
      child: ListView.builder(
        itemCount: getCategoryProvider(context).categoryList.length,
        itemBuilder: (context, index){
          return _getCategoryItem(index);
        },
      ),
    );
  }
  
  Widget _getCategoryItem(int index){
    var provider = getCategoryProvider(context);
    return InkWell(
      onTap: () {
        if (index != getCategoryProvider(context).currentIndex) {
          setState(() {
            getCategoryProvider(context).updateIndex(index);
            loadGoodsList();
          });
        }
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: provider.currentIndex == index ? Color.fromRGBO(0xDD, 0xDD, 0xDD, 1) : Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.black12, width: 1),
            )
        ),
        child: Text(provider.categoryList[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(26)),),
      ),
    );
  }
}
