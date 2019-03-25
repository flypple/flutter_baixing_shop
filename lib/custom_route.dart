import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget widget;
  CustomRoute(this.widget):super(
    transitionDuration: Duration(milliseconds: 800),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1.0, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(
          animation,
        ),
        child: child,
      );
    }
  );
}