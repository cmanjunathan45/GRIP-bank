import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("press"),
          onPressed: () {
            String one = "1";
            int after = int.parse(one);
            print(after);
          },
        ),
      ),
    );
  }
}
