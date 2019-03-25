import 'package:flutter/material.dart';

import 'index_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween(begin: 0.6, end: 1.0).animate(controller);
    animation2 = Tween(begin: 0.0, end: 1.0).animate(controller);
    animation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
//        Navigator.of(context).push(CustomRoute(IndexPage()));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context){
              return IndexPage();
            },
          ),
          (route){
            return route == null;
          },
        );
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: animation,
        child: Scaffold(
          backgroundColor: Colors.pink,
          appBar: AppBar(
            title: Text("百姓生活+"),
            elevation: 0.0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RotationTransition(
                  turns: animation2,
                  child: Text(
                    "百姓生活+  您的贴身好助理",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
