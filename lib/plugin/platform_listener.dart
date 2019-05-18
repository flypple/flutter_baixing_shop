import 'dart:async';

import 'package:flutter/services.dart';

const String _CHANNEL_NAME = "flypple/platform_event";
const EventChannel _kChannel = EventChannel(_CHANNEL_NAME);
StreamSubscription _listener;

class PlatformListener {

  static void reset() {
    cancel();
  }

  static void listen<T>(void Function(T event) onData){
    if (_listener == null) {
      _listener = _kChannel.receiveBroadcastStream("咳咳").listen(onData);
    }
  }

  static void cancel(){
    if (_listener != null) {
      _listener.cancel();
      _listener = null;
    }
  }
}