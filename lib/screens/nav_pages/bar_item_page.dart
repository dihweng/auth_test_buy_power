import 'package:flutter/cupertino.dart';

class BarPage extends StatefulWidget {
  BarPage({Key key}) : super(key: key);

  @override
  _BarPageState createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Bar chart Page")
      ),
    );
  }
}