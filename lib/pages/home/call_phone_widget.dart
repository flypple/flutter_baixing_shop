import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class CallPhoneWidget extends StatelessWidget {

  final String image;
  final String phone;

  CallPhoneWidget({this.image, this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Image.network(image),
        onTap: _callPhone,
      ),
    );
  }

  void _callPhone() async {
    String phoneUrl = "tel:$phone";

    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw "url异常，不能正常启动";
    }
  }
}
