import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service_url.dart';

// Future getHomePageContent() async {
//   try {
//     print('开始获取首页数据............');
//     var dio = Dio();
//     dio.options.contentType = 'application/x-www-form-urlencoded';
//     var formData = {'lon': '115.02932', 'lat': '35.76189'};
//     var response = await dio.post(
//       servicePath['homePageContent'],
//       data: formData,
//     );
//     if (response.statusCode == 200) {
//       return response.data;
//     } else {
//       throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
//     }
//   } catch (e) {
//     return e;
//   }
// }

Future request(url, {formData}) async {
  try {
    print('开始获取数据............');
    Response response;
    var dio = Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return e;
  }
}
