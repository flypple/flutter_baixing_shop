import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_baixing_shop/config/http_service.dart';
import 'package:flutter_baixing_shop/bean/category_bean.dart';
import 'dart:convert';

//获取首页主体内容
Future getHomePageContent() async {
  print("开始获取首页数据......");
  Map formData = {"lon": "115.02932", "lat": "35.76189"};
  return await request(servicePath["homePageContent"], formData: formData);
}

//获取首页主体内容
Future getHomePageBelowConten(int page) async {
  print("开始获取首页底部数据......");
  Map formData = {"page" : page};
  return await request(servicePath["homePageBelowConten"], formData: formData);
}

//获取首页主体内容
Future<CategoryBean> getCategory() async {
  print("开始获取首页底部数据......");
  var data = await request(servicePath["homePageBelowConten"]);
  return await CategoryBean.fromJson(jsonDecode(data));
}

Future request(String url, {formData}) async {
  try {
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    Response response;
    if (formData == null) {
      response = await dio.post(url);
    } else {
      response = await dio.post(url, data: formData);
    }

    if (response.statusCode == 200) {
      print("获取到数据 =====> ${response.data}");
      return response.data;
    } else {
      throw Exception("后端出现异常......");
    }
  } catch (e) {
    return print("Error: ===========> $e");
  }
}
