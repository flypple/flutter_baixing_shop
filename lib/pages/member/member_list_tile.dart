import 'package:flutter/material.dart';

class MemberListTile extends StatelessWidget {

  final String title;
  final IconData iconData;
  final double marginTop;
  final double marginBottom;
  final Widget extra;
  final Function onTap;

  const MemberListTile({this.title = "", this.iconData = Icons.menu, this.marginTop = 0, this.marginBottom = 0, this.extra = null, this.onTap = null});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = getChildren();
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  List<Widget> getChildren() {
    var list = new List<Widget>();
    list.add(Icon(iconData, color: Colors.grey,));
    list.add(Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 12),
        child: Text("我的订单"),
      ),
    ));
    if (extra != null) {
      list.add(extra);
    }
    list.add(Icon(Icons.arrow_forward_ios, color: Colors.grey,));
    return list;
  }
}
