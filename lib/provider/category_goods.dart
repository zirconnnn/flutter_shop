import 'package:flutter/material.dart';
import 'package:flutter_shop/beans/category_goods_list_bean.dart';

class CategoryGoodsProvider with ChangeNotifier {
  List<CategoryGoodsItem> categoryGoods = [];
  int page = 1;
  bool noMore = false;

  setupCategoryGoodsList(List<CategoryGoodsItem> goods) {
    noMore = false;
    page = 2;
    categoryGoods.clear();
    if (goods != null && goods.isNotEmpty) {
      categoryGoods.addAll(goods);
    }
    notifyListeners();
  }

  appendCategoryGoodList(List<CategoryGoodsItem> goods) {
    if (goods != null && goods.isNotEmpty) {
      noMore = false;
      page++;
      categoryGoods.addAll(goods);
    } else {
      noMore = true;
    }
    notifyListeners();
  }
}
