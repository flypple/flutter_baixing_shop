import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_baixing_shop/provide/index_provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_baixing_shop/pages/home/home_page.dart';
import 'package:flutter_baixing_shop/pages/category/category_page.dart';
import 'package:flutter_baixing_shop/pages/shopping_cart/cart_page.dart';
import 'package:provide/provide.dart';
import 'member_page.dart';

class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text("分类"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text("购物车"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text("会员中心"),
    ),
  ];
  
  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    ShoppingCartPage(),
    MemberPage(),
  ];

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(height: 1334, width: 750)..init(context);

    return Provide<IndexProvider>(
      builder: (context, child, provider) {
        return Scaffold(
          body: IndexedStack(
            index: provider.currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: _bottomTabs,
              currentIndex: provider.currentIndex,
              onTap: (index){
                provider.changeIndex(index);
              },
            ),
          ),
          resizeToAvoidBottomPadding: false,
        );
      },
    );
  }
}
