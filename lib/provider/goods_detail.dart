import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/beans/goods_detail_bean.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/service/service_method.dart';

class GoodsDetailProvider with ChangeNotifier {
  GoodsDetailBean goods;
  requestGoodsDetail(String id) {
    var formData = {'goodId': id};
    request(
      getGoodDetailById,
      formData: formData,
    ).then((value) {
      var data = json.decode(value.toString());
      goods = GoodsDetailBean.fromJson(data);
      notifyListeners();
    });
  }
}
