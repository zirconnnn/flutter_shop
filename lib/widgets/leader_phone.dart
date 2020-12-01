import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final String leaderImageUrl;
  final String leaderPhone;
  const LeaderPhone({Key key, this.leaderImageUrl, this.leaderPhone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _callLeaderPhone,
        child: Image.network(leaderImageUrl),
      ),
    );
  }

  void _callLeaderPhone() async {
    String url = 'tel:' + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'cannot launch $url';
    }
  }
}
