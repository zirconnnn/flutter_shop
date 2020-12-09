import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/routes/router_manager.dart';
import './pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    RouterManager.router = router;
    RouterManager.configRoutes(router);
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
            onGenerateRoute: RouterManager.router.generator,
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
