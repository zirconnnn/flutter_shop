import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/widgets/custom_ad_banner.dart';
import 'package:flutter_shop/widgets/custom_swiper.dart';
import 'package:flutter_shop/widgets/custom_top_navigator.dart';
import 'package:flutter_shop/widgets/floor.dart';
import 'package:flutter_shop/widgets/home_below_content.dart';
import 'package:flutter_shop/widgets/leader_phone.dart';
import 'package:flutter_shop/widgets/recommend.dart';
import '../service/service_method.dart';

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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('测试'),
        ),
        body: FutureBuilder(
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomSwiper(
                      swiperDataList: swiperDataList,
                    ),
                    TopNavigator(
                      navigatorList: navigatorDataList,
                    ),
                    AdBanner(
                      imgUrl: data['data']['advertesPicture']['PICTURE_ADDRESS']
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
              );
            } else {
              return Center(
                child: Text('加载中...'),
              );
            }
          },
        ),
      ),
    );
  }
}
