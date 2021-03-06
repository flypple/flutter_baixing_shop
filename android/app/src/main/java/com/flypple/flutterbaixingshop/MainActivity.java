package com.flypple.flutterbaixingshop;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.customer.AndroidToast;
import io.flutter.plugins.customer.PlatformListener;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    AndroidToast.registerWith(registrarFor("io.flutter.plugins.customer.AndroidToast"));
    PlatformListener.registerWith(registrarFor("io.flutter.plugins.customer.PlatformListener"));
  }
}
