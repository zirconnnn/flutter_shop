import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/right_category.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_shop/beans/category_list_bean.dart';
import 'package:flutter_shop/beans/category_goods_list_bean.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/provider/category_goods.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';

class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<RightCategoryProvider>().rightCategoryList;
    return Container(
      height: 80.h,
      width: 570.w,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => _item(index, data[index]),
      ),
    );
  }

  Widget _item(int index, BxMallSubDto item) {
    return InkWell(
      onTap: () {
        context.read<RightCategoryProvider>().changeSubSelectedIndex(index);
        _goodsListData(
          categoryId: context.read<RightCategoryProvider>().categoryId,
          categorySubId: item.mallSubId,
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            fontSize: 28.sp,
            color:
                context.read<RightCategoryProvider>().subSelectedIndex == index
                    ? Colors.pink
                    : Colors.black,
          ),
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
      CategoryGoodsListBean listModel = CategoryGoodsListBean.fromJson(data);
      context
          .read<CategoryGoodsProvider>()
          .setupCategoryGoodsList(listModel.data);
    });
  }
}
