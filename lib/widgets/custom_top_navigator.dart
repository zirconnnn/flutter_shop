import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class TopNavigator extends StatelessWidget {
  final List navigatorList;
  const TopNavigator({Key key, this.navigatorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList
            .map(
              (e) => _gridViewItemUI(context, e),
            )
            .toList(),
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Image.network(
            item['image'],
            width: 95.w,
          ),
          Text(
            item['mallCategoryName'],
          ),
        ],
      ),
    );
  }
}
