import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

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
          _firstRow(),
          _otherGoods(),
        ],
      ),
    );
  }

  Widget _goodsItem(Map goods) {
    return Container(
      width: 375.w,
      child: InkWell(
        onTap: () {
          print('点击了楼层商品');
        },
        child: Image.network(
          goods['image'],
        ),
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: [
        _goodsItem(floorGoodsList[0]),
        Column(
          children: [
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: [
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }
}
