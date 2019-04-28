import 'package:flutter/material.dart';

import 'member_list_tile.dart';

class MemberOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          orderTitle(),
          orderBody(),
        ],
      ),
    );
  }

  Widget orderTitle() {
    return MemberListTile(
      title: "我的订单",
      iconData: Icons.assignment,
      marginTop: 18,
      marginBottom: 1,
    );
  }

  Widget orderBody() {
    return Container(
      color: Colors.white,
      height: 64,
      child: Row(
        children: <Widget>[
          item("待付款", Icons.credit_card,),
          item("待发货", Icons.access_time,),
          item("待收货", Icons.directions_car,),
          item("待评价", Icons.library_books,),
        ],
      ),
    );
  }

  Widget item(String title, IconData iconData) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData, color: Colors.grey,),
            Text(title),
          ],
        ),
      ),
    );
  }
}
