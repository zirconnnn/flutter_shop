import 'dart:async';

import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  MemberPage({Key key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  StreamController<List<String>> _dataController =
      StreamController<List<String>>();
  StreamSink<List<String>> get _dataSink => _dataController.sink;
  Stream<List<String>> get _dataSteam => _dataController.stream;
  // StreamSubscription _dataSubscription;

  @override
  void initState() {
    super.initState();
    // _dataSubscription = _dataSteam.listen((event) {
    //   print(event.toString());
    // });
  }

  @override
  void dispose() {
    super.dispose();
    // _dataSubscription.cancel();
    _dataController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员'),
      ),
      body: StreamBuilder(
        stream: _dataSteam,
        initialData: ['none'],
        builder: (context, snapshot) {
          var data = snapshot.data as List;
          return Container(
            child: Column(
              children: data
                  .map(
                    (e) => Text(e.toString()),
                  )
                  .toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _dataSink.add(['first', 'second', 'third']);
        },
      ),
    );
  }
}
