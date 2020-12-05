import 'package:flutter/material.dart';
import 'package:flutter_shop/beans/category_list_bean.dart';

class RightCategoryProvider with ChangeNotifier {
  List<BxMallSubDto> rightCategoryList = [];
  String categoryId = "";
  int subSelectedIndex = 0;
  String get subSelectedId => rightCategoryList[subSelectedIndex].mallSubId;

  setupRightCategoryList(String cId, List<BxMallSubDto> list) {
    subSelectedIndex = 0;
    categoryId = cId;
    rightCategoryList.clear();
    rightCategoryList.add(
      BxMallSubDto()
        ..mallCategoryId = ''
        ..mallSubId = ''
        ..mallSubName = '全部'
        ..comments = 'null',
    );
    rightCategoryList.addAll(list);
    notifyListeners();
  }

  changeSubSelectedIndex(int index) {
    subSelectedIndex = index;
    notifyListeners();
  }
}
