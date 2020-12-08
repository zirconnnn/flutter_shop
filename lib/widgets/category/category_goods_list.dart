import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/beans/category_goods_list_bean.dart';
import 'package:flutter_shop/provider/category_goods.dart';
import 'package:flutter_shop/provider/right_category.dart';
import 'package:flutter_shop/widgets/custom_refresh_footer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'dart:convert';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/service/service_method.dart';

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  var scrollController = ScrollController();
  var refreshController = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    var data = context.watch<CategoryGoodsProvider>().categoryGoods;
    if (context.watch<CategoryGoodsProvider>().page == 2) {
      try {
        scrollController.jumpTo(0.0);
      } catch (e) {
        print('first load $e');
      }
    }
    try {
      refreshController.finishLoad(
          noMore: context.watch<CategoryGoodsProvider>().noMore);
    } catch (e) {
      print('first load $e');
    }
    if (data.isEmpty) {
      return Center(
        child: Text('暂无数据.'),
      );
    } else {
      return Expanded(
        child: Container(
          width: 570.w,
          // height: 1000.h,
          child: EasyRefresh(
            controller: refreshController,
            footer: customFooter,
            child: ListView.builder(
              controller: scrollController,
              itemCount: data.length,
              itemBuilder: (context, index) => _item(data[index]),
            ),
            onLoad: () async {
              _goodsListData(
                categoryId: context.read<RightCategoryProvider>().categoryId,
                categorySubId:
                    context.read<RightCategoryProvider>().subSelectedId,
                page: context.read<CategoryGoodsProvider>().page,
              );
            },
          ),
        ),
      );
    }
  }

  Widget _item(CategoryGoodsItem item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          children: [
            _goodsImage(item.image),
            Column(
              children: [
                _goodsName(item.goodsName),
                _goodsPrice(
                    item.presentPrice.toString(), item.oriPrice.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _goodsImage(String url) {
    return Container(
      width: 200.w,
      child: Image.network(url),
    );
  }

  Widget _goodsName(String name) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: 370.w,
      child: Text(
        name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 28.sp),
      ),
    );
  }

  Widget _goodsPrice(String presentPrice, String oriPrice) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: 370.w,
      child: Row(
        children: [
          Text(
            '价格: ￥$presentPrice',
            style: TextStyle(
              color: Colors.pink,
              fontSize: 30.sp,
            ),
          ),
          Text(
            '￥$oriPrice',
            style: TextStyle(
              color: Colors.black26,
              // fontSize: 30.sp,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
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
          .appendCategoryGoodList(listModel.data);
    });
  }
}
