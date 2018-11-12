import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key, this.title, this.startNavigationTime})
      : super(key: key);

  final String title;
  final int startNavigationTime;

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationPage> {
  int navigationResult = 0;

  @override
  initState() {
    super.initState();
    setState(() {
      navigationResult =
          DateTime.now().millisecondsSinceEpoch - widget.startNavigationTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Result:'),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(navigationResult.toString()),
              Text(' ms'),
            ]),
          ],
        ),
      ),
    );
  }
}
