import 'package:flutter/material.dart';

import 'member_header.dart';
import 'member_order.dart';
import 'member_list.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("会员中心"),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              MemberHeader(),
              MemberOrder(),
              MemberList(),
            ],
          )
        ),
      ),
    );
  }
}
