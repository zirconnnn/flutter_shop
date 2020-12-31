import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MemberPage extends StatefulWidget {
  MemberPage({Key key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  var _stream = PublishSubject<String>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员'),
      ),
      body: StreamBuilder(
        stream: _stream.map((event) => event + event),
        initialData: 'none',
        builder: (context, snapshot) {
          var data = snapshot.data as String;
          return Container(child: Text(data));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _stream.add('hello');
        },
      ),
    );
  }
}

class MemberBLoC {}
