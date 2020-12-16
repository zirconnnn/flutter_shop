import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/goods_detail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/size_extension.dart';

class DetailComments extends StatelessWidget {
  const DetailComments({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var comments = context.watch<GoodsDetailProvider>().goods.data.goodComments;
    if (comments == null || comments.isEmpty) {
      return Container(
        child: Center(
          child: Text('暂无评论.'),
        ),
      );
    } else {
      return Container(
        // constraints: BoxConstraints(maxHeight: 300.h),
        padding: EdgeInsets.all(15.w),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: comments.length,
          itemBuilder: (context, index) => Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comments[index].userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  comments[index].comments,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  DateTime.fromMillisecondsSinceEpoch(
                          comments[index].discussTime)
                      .toString(),
                  style: TextStyle(fontSize: 20.sp),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
