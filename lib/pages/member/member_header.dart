import 'package:flutter/material.dart';

import 'package:flutter_baixing_shop/plugin/platform_listener.dart';

class MemberHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: SweepGradient(colors: [
          Colors.pinkAccent,
          Color(0xFF5FCCE8),
          Color(0xFF58CCE8),
          Color(0xFF8F49E1),
          Colors.purpleAccent,
          Colors.pinkAccent,
        ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/image/avatar.jpg",
              ),
              radius: 60,
            ),
//            child: Image.network("https://avatars3.githubusercontent.com/u/30929958?s=460&v=4"),
          ),
          NameTitle(),
        ],
      ),
    );
  }
}

class NameTitle extends StatefulWidget {
  @override
  _NameTitleState createState() => _NameTitleState();
}

class _NameTitleState extends State<NameTitle> with SingleTickerProviderStateMixin {
  int num = 0;

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() {
    PlatformListener.reset();
    PlatformListener.listen((data) {
      setState(() {
        print("监听到本地数据：$data");
        num = data;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    stop();
  }

  void stop() {
    PlatformListener.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: start,
        child: Text("flypple $num", style: TextStyle(color: Colors.white, fontSize: 18),),
      ),
    );
  }
}

