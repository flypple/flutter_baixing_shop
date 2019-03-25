import 'package:flutter/material.dart';
import 'package:flutter_baixing_shop/service/service_method.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    getCategory().then((value){
      setState(() {
        data = value.message;
      });
    });
    String text = data.isEmpty ? "分类" : data;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("分类"),
        ),
        body: Center(
          child: Text(text),
        ),
      ),
    );
  }
}

