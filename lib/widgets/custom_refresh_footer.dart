import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

Footer get customFooter => ClassicalFooter(
      bgColor: Colors.white,
      textColor: Colors.pink,
      showInfo: false,
      loadReadyText: '上拉加载',
      loadingText: '加载中...',
      loadedText: '加载完成.',
      noMoreText: '没有更多了.',
    );
