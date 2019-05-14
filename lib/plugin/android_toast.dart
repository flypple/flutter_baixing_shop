import 'dart:async';

import 'package:flutter/services.dart';

//通道名称————必须和Android与IOS插件类中的名称相同，无法实现方法调用。
const String CHANNEL_NAME = "flypple/AndroidToast";

const MethodChannel _kChannel = MethodChannel(CHANNEL_NAME);

class AndroidToast {

  static Future showToast(String text) async {
    return await _kChannel.invokeMethod("showToast", {"text": text});
  }

  static Future cancel() async {
    return await _kChannel.invokeMethod("cancel");
  }
}