import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/goods_detail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/beans/goods_detail_bean.dart';
import 'package:flutter_screenutil/size_extension.dart';

class DetailTopArea extends StatelessWidget {
  const DetailTopArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var goods = context.watch<GoodsDetailProvider>().goods.data.goodInfo;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(2.0),
      child: Column(
        children: [
          _goodsImage(goods.image1),
          _goodsName(goods.goodsName),
          _goodsNum(goods.goodsSerialNumber),
          _goodsPrice(goods.presentPrice, goods.oriPrice),
        ],
      ),
    );
  }

  Widget _goodsImage(url) {
    return Image.network(
      url,
      width: 740.w,
    );
  }

  Widget _goodsName(name) {
    return Container(
      width: 730.w,
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(fontSize: 30.sp),
      ),
    );
  }

  Widget _goodsNum(num) {
    return Container(
      width: 730.w,
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号:$num',
        style: TextStyle(color: Colors.black26),
      ),
    );
  }

  Widget _goodsPrice(presentPrice, oriPrice) {
    return Container(
      width: 730.w,
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Text(
            '￥$presentPrice',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 40.sp,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Text(
              '市场价：',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Text(
            '￥$oriPrice',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
