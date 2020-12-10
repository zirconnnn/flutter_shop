import 'package:flutter/material.dart';
import 'package:flutter_shop/routes/router_manager.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/size_extension.dart';

class CustomSwiper extends StatelessWidget {
  final List swiperDataList;
  const CustomSwiper({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333.h,
      width: 750.w,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            '${swiperDataList[index]['image']}',
            fit: BoxFit.fill,
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        // control: SwiperControl(),
        autoplay: true,
        onTap: (index) {
          RouterManager.router.navigateTo(
            context,
            '${RouterManager.detialPage}?id=${swiperDataList[index]['goodsId']}',
          );
        },
      ),
    );
  }
}
