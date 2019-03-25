import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  final String bannerImage;

  const AdBanner({Key key, this.bannerImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Image.network(bannerImage),
    );
  }
}
