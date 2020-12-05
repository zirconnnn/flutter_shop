import 'package:flutter/material.dart';
import 'package:flutter_shop/beans/category_goods_list_bean.dart';
import 'package:flutter_shop/beans/category_list_bean.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/provider/category_goods.dart';
import 'package:flutter_shop/provider/right_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<Data> list = [];
  int selectedIndex = 0;

  @override
  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => _leftItem(index),
      ),
    );
  }

  void _getCategory() async {
    await request(getCategory).then((value) {
      var data = json.decode(value.toString());
      var category = CategoryBigListModel.fromJson(data);
      setState(() {
        list = category.data;
      });
      context.read<RightCategoryProvider>().setupRightCategoryList(
            list[0].mallCategoryId,
            list[0].bxMallSubDto,
          );
      _goodsListData(categoryId: list[0].mallCategoryId);
    });
  }

  Widget _leftItem(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        context.read<RightCategoryProvider>().setupRightCategoryList(
              list[index].mallCategoryId,
              list[index].bxMallSubDto,
            );
        _goodsListData(categoryId: list[index].mallCategoryId);
      },
      child: Container(
        height: 100.h,
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.black26 : Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: 28.sp),
        ),
      ),
    );
  }

  void _goodsListData({
    String categoryId = '4',
    String categorySubId = '',
    int page = 1,
  }) {
    var formData = {
      'categoryId': categoryId,
      'categorySubId': categorySubId,
      'page': page,
    };
    request(getMallGoods, formData: formData).then((value) {
      var data = json.decode(value.toString());
      CategoryGoodsListModel listModel = CategoryGoodsListModel.fromJson(data);
      context
          .read<CategoryGoodsProvider>()
          .setupCategoryGoodsList(listModel.data);
    });
  }
}
