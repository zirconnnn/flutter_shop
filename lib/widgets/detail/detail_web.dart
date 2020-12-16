import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/provider/goods_detail.dart';
import 'package:provider/provider.dart';

class DetailWeb extends StatelessWidget {
  const DetailWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(
        data: context
            .watch<GoodsDetailProvider>()
            .goods
            .data
            .goodInfo
            .goodsDetail,
      ),
    );
  }
}
