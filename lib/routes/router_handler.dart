import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/pages/detail_page.dart';

var detailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  String goodsId = parameters['id'].first;
  return DetailPage(
    id: goodsId,
  );
});
