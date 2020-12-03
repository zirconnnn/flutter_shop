import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/beans/category_list_bean.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_screenutil/size_extension.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: Row(
        children: [
          LeftCategoryNav(),
        ],
      ),
    );
  }
}

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<Data> list = [];

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
      var category = CategoryBigListModel.fromJson(
        data as Map<String, dynamic>,
      );
      setState(() {
        list = category.data;
      });
    });
  }

  Widget _leftItem(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100.h,
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
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
}
