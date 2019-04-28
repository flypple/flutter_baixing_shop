import 'package:flutter/material.dart';
import 'member_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          MemberListTile(title: "领取优惠券", iconData: Icons.credit_card, marginTop: 18, ),
          MemberListTile(title: "已领取优惠券", iconData: Icons.credit_card, marginTop: 2),
          MemberListTile(title: "地址管理", iconData: Icons.add_location, marginTop: 2),
          MemberListTile(
            title: "客服电话",
            iconData: Icons.phone_forwarded,
            marginTop: 18,
            extra: Container(
              margin: EdgeInsets.only(right: 6),
              child: Text("0393-8800315", style: TextStyle(fontSize: 12, color: Colors.grey),),
            ),
            onTap: () {
              call();
            },
          ),
          MemberListTile(title: "关于商城", iconData: Icons.info, marginTop: 2),
        ],
      ),
    );
  }

  void call() async {
    String urlForLaunch = "tel:0393-8800315";
    if (await canLaunch(urlForLaunch)) {
      await launch(urlForLaunch);
    } else {
      print("MemberList: url异常，不能正常启动");
    }
  }
}
