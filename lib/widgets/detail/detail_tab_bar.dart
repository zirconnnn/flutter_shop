import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/detail/detail_comments.dart';
import 'package:flutter_shop/widgets/detail/detail_web.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/size_extension.dart';

class DetailTabBar extends StatefulWidget {
  DetailTabBar({Key key}) : super(key: key);

  @override
  _DetailTabBarState createState() => _DetailTabBarState();
}

class _DetailTabBarState extends State<DetailTabBar>
    with SingleTickerProviderStateMixin {
  final tabs = ['详情', '评论'];
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildTabBar(),
          // Expanded(
          //   flex: 0,
          //   child: _buildTabBarView(),
          // ),
          Container(
            constraints: BoxConstraints(maxHeight: 1500.h),
            child: _buildTabBarView(),
          )
        ],
      ),
    );
  }

  Widget _buildTabBar() => TabBar(
        controller: _tabController,
        labelColor: Colors.pinkAccent,
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.pinkAccent,
        tabs: tabs
            .map((e) => Tab(
                  text: e,
                ))
            .toList(),
      );

  Widget _buildTabBarView() => TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          switch (e) {
            case '详情':
              return DetailWeb();
            case '评论':
              return DetailComments();
            default:
              return Text('暂无内容.');
          }
          // return DetailWeb();
        }).toList(),
      );
}

// class DetailTabBar extends StatelessWidget {
//   const DetailTabBar({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final tabs = ['详情', '评论'];
//     return Container(
//       child: Column(
//         children: [],
//       ),
//     );
//   }

//   Widget _buildTabBar(List<String> tabs) => TabBar(
//         controller: TabController(length: tabs.length, vsync: this),
//         tabs: tabs
//             .map((e) => Tab(
//                   text: e,
//                 ))
//             .toList(),
//       );
// }
