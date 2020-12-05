import 'package:flutter/material.dart';
import 'package:flutter_shop/beans/category_goods_list_bean.dart';

class CategoryGoodsProvider with ChangeNotifier {
  List<CategoryGoodsItem> categoryGoods = [];
  int page = 1;
  bool hasNoMore = false;

  setupCategoryGoodsList(List<CategoryGoodsItem> goods) {
    hasNoMore = false;
    page = 2;
    categoryGoods.clear();
    if (goods != null && goods.isNotEmpty) {
      categoryGoods.addAll(goods);
    }
    notifyListeners();
  }

  appendCategoryGoodList(List<CategoryGoodsItem> goods) {
    if (goods != null && goods.isNotEmpty) {
      hasNoMore = false;
      page++;
      categoryGoods.addAll(goods);
    } else {
      hasNoMore = true;
    }
    notifyListeners();
  }
}
