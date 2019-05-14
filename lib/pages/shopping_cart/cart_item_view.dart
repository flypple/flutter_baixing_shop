import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_baixing_shop/bean/shopping_info.dart';
import 'package:flutter_baixing_shop/provide/shopping_cart_provider.dart';
import 'package:flutter_baixing_shop/utils/toast_utils.dart';
import 'package:flutter_baixing_shop/plugin/android_toast.dart';

class CartItemView extends StatelessWidget {
  final ShoppingInfo shoppingInfo;

  const CartItemView({this.shoppingInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          checkBox(context),
          goodsImage(),
          actionAndGoodsName(context),
          priceAndDelete(context),
        ],
      ),
    );
  }

  Widget checkBox(BuildContext context){
    return Container(
      child: Checkbox(
        value: shoppingInfo.isChecked,
        onChanged: (value) {
          ShoppingCartProvider.getProvider(context).changeItemCheckedState(shoppingInfo);
        },
      ),
    );
  }

  Widget goodsImage(){
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 1)
      ),
      child: Image.network(shoppingInfo.image),
    );
  }

  Widget actionAndGoodsName(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(
                "${shoppingInfo.goodsName}",
                style: TextStyle(fontSize: 13),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            actionView(context)
          ],
        ),
      ),
    );
  }

  Container actionView(BuildContext context) {
    var border = BorderSide(color: Colors.grey, width: 0.8);
    var subIcon = shoppingInfo.count > 1
        ? Icon(Icons.remove, size: 14,)
        : null;
    var subColor = shoppingInfo.count > 1
        ? null
        : Colors.black12;
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border(left: border, top: border, bottom: border),
              color: subColor,
            ),
            child: InkWell(
              onTap: () {
                changeItemCount(context, false);
              },
              child: subIcon,
            ),
          ),
          Container(
            height: 24,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 16, right: 16,),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.8)
            ),
            child: Text(
              "${shoppingInfo.count}",
              style: TextStyle(fontSize: 13),
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border(top: border, right: border, bottom: border),
            ),
            child: InkWell(
              onTap: () {
                changeItemCount(context, true);
              },
              child: Icon(Icons.add, size: 14),
            ),
          ),
        ],
      ),
    );
  }

  void changeItemCount(BuildContext context, bool add) {
    if (add) {
      ShoppingCartProvider.getProvider(context).add(shoppingInfo);
    } else {
      if (shoppingInfo.count > 1) {
        ShoppingCartProvider.getProvider(context).sub(shoppingInfo);
      } else {
        AndroidToast.showToast("不能再减少了~");
      }
    }
  }

  Widget priceAndDelete(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12,right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text("￥${shoppingInfo.price}", style: TextStyle(fontSize: 13),),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: InkWell(
              onTap: () {
//                ShoppingCartProvider.getProvider(context).deleteShopping(shoppingInfo);
              askDeleted(context);
              },
              child: Icon(CupertinoIcons.delete, color: Colors.grey,),
            ),
          )
        ],
      ),
    );
  }

  void askDeleted(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text("确定要从购物车中删除该商品？"),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("取消", style: TextStyle(color: Colors.grey,),),
            ),
            CupertinoDialogAction(
              onPressed: () {
                ShoppingCartProvider.getProvider(context).deleteShopping(shoppingInfo);
                Navigator.of(context).pop();
              },
              child: Text("确定", style: TextStyle(color: Colors.blue,),),
            ),
          ],
        );
      },
    );
  }
}
