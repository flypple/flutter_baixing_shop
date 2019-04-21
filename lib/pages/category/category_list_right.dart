import 'package:flutter/material.dart';
import 'package:flutter_baixing_shop/provide/mall_goods_provider.dart';
import 'package:flutter_baixing_shop/service/service_method.dart';
import 'package:provide/provide.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_baixing_shop/provide/category_provider.dart';

class CategoryListRight extends StatefulWidget {

  @override
  _CategoryListRightState createState() => _CategoryListRightState();
}

class _CategoryListRightState extends State<CategoryListRight> {

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<CategoryProvider>(
        builder: (builder, child, provider) {
          try {
            if (provider.newCategory) {
              _scrollController.jumpTo(0);
            }
          } catch (e) {
            print("第一次初始化$e");
          }
          var categorys = provider.subCategoryList;
          print(categorys);
          return Container(
            width: ScreenUtil().setWidth(570),
            height: ScreenUtil().setHeight(80),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black26))
            ),
            child: categorys.isNotEmpty ?
            ListView.builder(
              itemCount: categorys.length,
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if (index != provider.currentSubIndex) {
                      getMallGoodsProvider(context).clear();
                      provider.newCategory = false;
                      provider.updateSubIndex(index);
                      loadGoodsList();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(12, 4, 8, 4),
                    child: Text(
                      categorys[index].mallSubName,
                      style: TextStyle(
                        color: index == provider.currentSubIndex ? Colors.pink : null,
                      ),
                    ),
                  ),
                );
              },
            ) :
            Container(),
          );
        },
      ),
    );
  }

  void loadGoodsList(){
    var provider = getCategoryProvider(context);
    getGoodsList(categoryId: provider.categoryId, subCategoryId: provider.subCategoryId, page: provider.pageIndex).then((value) {
      provider.pageIndex ++;
      getMallGoodsProvider(context).setData(value.data);
    });
  }
}
