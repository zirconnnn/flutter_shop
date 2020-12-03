import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/pages/home_page.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:provider/provider.dart';

class HomeBelowContent extends StatefulWidget {
  HomeBelowContent({Key key}) : super(key: key);

  @override
  _HomeBelowContentState createState() => _HomeBelowContentState();
}

class _HomeBelowContentState extends State<HomeBelowContent> {
  List<Map> dataList = [];
  @override
  Widget build(BuildContext context) {
    // int page = context.watch<PageCountModel>().page;
    int page = context.select((PageCountModel value) => value.page);
    return FutureBuilder(
      future: request(
        homePageBelowContent,
        formData: {
          'page': page,
        },
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = json.decode(snapshot.data.toString());
          if (data['data'] == null) {
            Provider.of<PageCountModel>(context, listen: false)
                .setupHasMoreValue(false);
          } else {
            dataList.addAll((data['data'] as List).cast());
          }
          return Column(
            children: [
              _title(),
              _list(),
            ],
          );
        } else {
          return Column(
            children: [
              _title(),
              Text(
                '暂无推荐',
              ),
            ],
          );
        }
      },
    );
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12,
          ),
        ),
      ),
      child: Text(
        '火爆专区',
      ),
    );
  }

  Widget _list() {
    if (dataList != null && dataList.isNotEmpty) {
      List<Widget> listWidgets = dataList.map((e) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: 372.w,
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: [
                Image.network(
                  e['image'],
                  fit: BoxFit.fill,
                ),
                Text(
                  e['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 26.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('￥${e['mallPrice']}'),
                    Text(
                      '￥${e['price']}',
                      style: TextStyle(
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidgets,
      );
    } else {
      return Text(' ');
    }
  }
}
