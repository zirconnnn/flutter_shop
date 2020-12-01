import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  final String imgUrl;
  const AdBanner({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        imgUrl,
      ),
    );
  }
}
