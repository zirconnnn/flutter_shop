import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class DetailBottom extends StatelessWidget {
  const DetailBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      height: 80.h,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 110.w,
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 320.w,
              color: Colors.green,
              child: Text(
                '加入购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 320.w,
              height: 80.h,
              color: Colors.red,
              child: Text(
                '马上购买',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
