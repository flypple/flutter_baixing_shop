import 'package:flutter/material.dart';
import 'package:flutter_baixing_shop/provide/goods_details_provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'goods_details_view.dart';
import 'goods_comments_view.dart';

class GoodsDetailsTab extends StatelessWidget {
  final GoodsDetailsProvider provider;

  GoodsDetailsTab({this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: createTab(),
          ),
          Container(
            child: createTabView(),
          ),
        ],
      ),
    );
  }

  Widget createTab() {
    return Row(
      children: [
        createTabItem(0, "详细"),
        createTabItem(1, "评论"),
      ],
    );
  }

  Widget createTabItem(int index, String title) {
    var isSelected = provider.tabPosition == index;
    Color textColor = isSelected ? Colors.pink : Colors.black87;
    Color borderColor = isSelected ? Colors.pink : Colors.grey;
    FontWeight fontWeight = isSelected ? FontWeight.bold : null;
    double borderWidth = isSelected ? 1.5 : 1;
    return InkWell(
      onTap: (){
        provider.setTabPosition(index);
      },
      child: Container(
        height: 42,
        width: ScreenUtil().setWidth(375),
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: borderColor, width: borderWidth))),
        child: Text(
          title,
          style: TextStyle(fontSize: 14, color: textColor, fontWeight: fontWeight),
        ),
      ),
    );
  }

  Widget createTabView() {
    return provider.tabPosition == 0
        ? GoodsDetailsView(detailsData: provider.goodsDetailsInfo.goodInfo.goodsDetail,)
        : GoodsCommentsView(info: provider.goodsDetailsInfo,);
  }
}

//todo TabBar+TabBarView虽然可以实现details和comments的左右滑动，但是也必须给自身设置固定高度，且内部的scroll和外部的scroll会产生冲突，怎么解决。
class GoodsDetailsTab2 extends StatelessWidget {
  final GoodsDetailsProvider provider;
  final double height;

  GoodsDetailsTab2({this.provider, this.height});

  @override
  Widget build(BuildContext context) {
    print("height ============> $height");
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Container(
        height: height - 42,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: createTab(),
            ),
            Expanded(
              child: Container(
                child: createTabView(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createTab() {
    return TabBar(
      labelColor: Colors.pink,
      unselectedLabelColor: Colors.black87,
      tabs: [
        createTabItem(0, "详细"),
        createTabItem(1, "评论"),
      ],
    );
  }

  Widget createTabItem(int index, String title) {
    return Container(
        height: 42,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(fontSize: 14,),
        ),
    );
  }

  Widget createTabView() {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Container(
            child: Html(data: provider.goodsDetailsInfo.goodInfo.goodsDetail,),
          ),
        ),
        GoodsCommentsView(info: provider.goodsDetailsInfo,),
      ],
    );
  }
}