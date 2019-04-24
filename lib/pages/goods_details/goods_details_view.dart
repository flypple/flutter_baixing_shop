import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class GoodsDetailsView extends StatelessWidget {
  final String detailsData;

  const GoodsDetailsView({this.detailsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(data: detailsData,),
    );
  }
}
