import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_baixing_shop/bean/home_data_result.dart';

class CallPhoneWidget extends StatelessWidget {

  final ShopInfo shopInfo;

  CallPhoneWidget({this.shopInfo,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Image.network(shopInfo.leaderImage),
        onTap: _callPhone,
      ),
    );
  }

  void _callPhone() async {
    String phoneUrl = "tel:${shopInfo.leaderPhone}";

    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw "url异常，不能正常启动";
    }
  }
}
