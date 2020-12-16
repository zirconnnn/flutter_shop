import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class DetailInstructions extends StatelessWidget {
  const DetailInstructions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      width: 750.w,
      padding: EdgeInsets.all(10),
      child: Text(
        '说明：> 急速送达 > 正品保证',
        style: TextStyle(
          color: Colors.red,
          fontSize: 30.sp,
        ),
      ),
    );
  }
}
