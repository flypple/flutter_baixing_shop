import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_baixing_shop/bean/home_data_result.dart';
import 'package:flutter_baixing_shop/route/routes.dart';

class MySwiper extends StatelessWidget {
  final List<Slides> slideList;

  MySwiper({this.slideList});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: slideList.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: () {
              Routes.toGoodsDetailsPage(context, slideList[index].goodsId);
            },
            child: Image.network(slideList[index].image, fit: BoxFit.fill,),
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}