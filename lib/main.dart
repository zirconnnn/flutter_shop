import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import './pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(
          constraints,
          designSize: Size(750, 1334),
          allowFontScaling: false,
        );
        return Container(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '百姓生活+',
            theme: ThemeData(
              primaryColor: Colors.pink,
            ),
            home: IndexPage(),
          ),
        );
      },
    );
  }
}
