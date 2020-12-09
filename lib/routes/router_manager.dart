import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routes/router_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class RouterManager {
  static FluroRouter router;

  static String root = '/';
  static String detialPage = '/detail';
  static void configRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      Fluttertoast.showToast(
        msg: 'not found!',
        gravity: ToastGravity.CENTER,
      );
    });
    router.define(detialPage, handler: detailHandler);
  }
}
