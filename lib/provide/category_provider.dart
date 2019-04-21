import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_baixing_shop/bean/category_bean.dart';

class CategoryProvider with ChangeNotifier {

  List<CategoryBean> categoryList = [];

  List<BxMallSubDto> subCategoryList = [];

  int currentIndex = 0;
  int currentSubIndex = 0;

  bool newCategory = false;

  String categoryId;
  String subCategoryId;
  int pageIndex = 1;

  void setCategoryList(List<CategoryBean> categoryList){
    this.categoryList = categoryList;
    updateIndex(0);
  }

  void updateIndex(int index){
    newCategory = true;
    currentIndex = index;
    var category = categoryList[currentIndex];

    subCategoryList.clear();
    subCategoryList.add(BxMallSubDto("", category.mallCategoryId, "全部", ""));
    if (category != null) {
      this.subCategoryList.addAll(category.bxMallSubDto);
    }

    categoryId = category.mallCategoryId;
    updateSubIndex(0);
    notifyListeners();
  }

  void updateSubIndex(int index){
    pageIndex = 1;
    currentSubIndex = index;
    subCategoryId = subCategoryList[currentSubIndex].mallSubId;
    notifyListeners();
  }
}

CategoryProvider getCategoryProvider(BuildContext context){
  return Provide.value<CategoryProvider>(context);
}