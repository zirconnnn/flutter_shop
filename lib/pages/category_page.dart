import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/category_goods.dart';
import 'package:flutter_shop/provider/right_category.dart';
import 'package:flutter_shop/widgets/category/category_goods_list.dart';
import 'package:flutter_shop/widgets/category/right_category_nav.dart';
import 'package:provider/provider.dart';
import '../widgets/category/left_category_nav.dart';

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
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<RightCategoryProvider>(
              create: (_) => RightCategoryProvider()),
          ChangeNotifierProvider<CategoryGoodsProvider>(
              create: (_) => CategoryGoodsProvider()),
        ],
        child: Row(
          children: [
            LeftCategoryNav(),
            Column(
              children: [
                RightCategoryNav(),
                CategoryGoodsList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
