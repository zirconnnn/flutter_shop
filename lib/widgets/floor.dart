import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_shop/routes/router_manager.dart';

class FloorTitle extends StatelessWidget {
  final String floorTitleImgUrl;
  const FloorTitle({Key key, this.floorTitleImgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(floorTitleImgUrl),
    );
  }
}

class FloorContent extends StatelessWidget {
  final List floorGoodsList;
  const FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _firstRow(context),
          _otherGoods(context),
        ],
      ),
    );
  }

  Widget _goodsItem(BuildContext context, Map goods) {
    return Container(
      width: 375.w,
      child: InkWell(
        onTap: () {
          RouterManager.router.navigateTo(
            context,
            '${RouterManager.detialPage}?id=${goods['goodsId']}',
          );
        },
        child: Image.network(
          goods['image'],
        ),
      ),
    );
  }

  Widget _firstRow(BuildContext context) {
    return Row(
      children: [
        _goodsItem(context, floorGoodsList[0]),
        Column(
          children: [
            _goodsItem(context, floorGoodsList[1]),
            _goodsItem(context, floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(BuildContext context) {
    return Row(
      children: [
        _goodsItem(context, floorGoodsList[3]),
        _goodsItem(context, floorGoodsList[4]),
      ],
    );
  }
}
