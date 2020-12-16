import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_shop/routes/router_manager.dart';

class Recommend extends StatelessWidget {
  final List recommendList;

  const Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          _titleWidget(),
          _recommendList(),
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0.0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12,
          ),
        ),
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(
          color: Colors.pink,
        ),
      ),
    );
  }

  Widget _item(BuildContext context, index) {
    return InkWell(
      onTap: () {
        RouterManager.router.navigateTo(
          context,
          '${RouterManager.detialPage}?id=${recommendList[index]['goodsId']}',
        );
      },
      child: Container(
        height: 340.h,
        width: 250.w,
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12),
          ),
        ),
        child: Column(
          children: [
            Image.network(
              recommendList[index]['image'],
            ),
            Text(
              '￥${recommendList[index]['mallPrice']}',
            ),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _recommendList() {
    return Container(
      height: 340.h,
      child: ListView.builder(
        itemBuilder: (context, index) => _item(context, index),
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
      ),
    );
  }
}
