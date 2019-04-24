import 'package:flutter/material.dart';

import 'package:flutter_baixing_shop/bean/home_data_result.dart';

class AdBanner extends StatelessWidget {
  final AdvertesPicture advertes;

  const AdBanner({Key key, this.advertes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Image.network(advertes.pICTUREADDRESS),
    );
  }
}
