import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_baixing_shop/pages/index_page.dart';

class MySwiper extends StatelessWidget {
  final List<Map> images;

  MySwiper({this.images});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: images.length,
        itemBuilder: (context, index){
          return Image.network(images[index]["image"].toString(), fit: BoxFit.fill,);
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}