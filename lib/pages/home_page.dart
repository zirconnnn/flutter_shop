import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/widgets/custom_ad_banner.dart';
import 'package:flutter_shop/widgets/custom_swiper.dart';
import 'package:flutter_shop/widgets/custom_top_navigator.dart';
import 'package:flutter_shop/widgets/floor.dart';
import 'package:flutter_shop/widgets/home_below_content.dart';
import 'package:flutter_shop/widgets/leader_phone.dart';
import 'package:flutter_shop/widgets/recommend.dart';
import '../service/service_method.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String homeContent = '正在请求中...';

  // @override
  // void initState() {
  //   getHomePageContent().then((value) {
  //     setState(() {
  //       homeContent = value.toString();
  //     });
  //   });
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
    print('test keep alive.');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('测试'),
        ),
        body: ChangeNotifierProvider(
          create: (_) => PageCountModel(),
          child: FutureBuilder(
            future: request(
              homePageContent,
              formData: {
                'lon': '115.02932',
                'lat': '35.76189',
              },
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                List<Map> swiperDataList =
                    (data['data']['slides'] as List).cast();
                List<Map> navigatorDataList = (data['data']['category'] as List)
                    .take(10)
                    .toList(growable: false)
                    .cast();
                List<Map> recommendDataList =
                    (data['data']['recommend'] as List).cast();
                List<Map> floor1DataList =
                    (data['data']['floor1'] as List).cast();
                List<Map> floor2DataList =
                    (data['data']['floor2'] as List).cast();
                List<Map> floor3DataList =
                    (data['data']['floor3'] as List).cast();
                return EasyRefresh(
                  footer: ClassicalFooter(
                    bgColor: Colors.white,
                    textColor: Colors.pink,
                    showInfo: false,
                    loadReadyText: '上拉加载',
                    loadingText: '加载中...',
                    loadedText: '加载完成.',
                    noMoreText: '没有更多了.',
                  ),
                  child: ListView(
                    children: [
                      CustomSwiper(
                        swiperDataList: swiperDataList,
                      ),
                      TopNavigator(
                        navigatorList: navigatorDataList,
                      ),
                      AdBanner(
                        imgUrl: data['data']['advertesPicture']
                                ['PICTURE_ADDRESS']
                            .toString(),
                      ),
                      LeaderPhone(
                        leaderImageUrl: data['data']['shopInfo']['leaderImage'],
                        leaderPhone: data['data']['shopInfo']['leaderPhone'],
                      ),
                      Recommend(
                        recommendList: recommendDataList,
                      ),
                      FloorTitle(
                        floorTitleImgUrl: data['data']['floor1Pic']
                            ['PICTURE_ADDRESS'],
                      ),
                      FloorContent(
                        floorGoodsList: floor1DataList,
                      ),
                      FloorTitle(
                        floorTitleImgUrl: data['data']['floor2Pic']
                            ['PICTURE_ADDRESS'],
                      ),
                      FloorContent(
                        floorGoodsList: floor2DataList,
                      ),
                      FloorTitle(
                        floorTitleImgUrl: data['data']['floor3Pic']
                            ['PICTURE_ADDRESS'],
                      ),
                      FloorContent(
                        floorGoodsList: floor3DataList,
                      ),
                      HomeBelowContent(),
                    ],
                  ),
                  onLoad: () async {
                    // await Future.delayed(Duration(seconds: 10));
                    context.read<PageCountModel>().inc();
                  },
                );
              } else {
                return Center(
                  child: Text('加载中...'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class PageCountModel with ChangeNotifier {
  int _pageCount = 1;
  bool _hasMoreContent = true;
  int get page => _pageCount;
  bool get hasMoreContent => _hasMoreContent;

  void inc() {
    if (!_hasMoreContent) {
      return;
    }
    _pageCount++;
    notifyListeners();
  }

  void setupHasMoreValue(bool hasMoreValue) {
    _hasMoreContent = hasMoreValue;
    notifyListeners();
  }
}
