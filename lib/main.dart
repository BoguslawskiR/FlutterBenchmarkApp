import 'package:flutter/material.dart';
import 'package:flutter_benchmark_app/animation.dart';
import 'package:flutter_benchmark_app/computing.dart';
import 'package:flutter_benchmark_app/naviagtion.dart';
import 'package:flutter_benchmark_app/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.lightBlue[600],
        buttonColor: Colors.lightBlue[600],
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationPage(
                              title: 'Navigation Benchmark',
                              startNavigationTime:
                                  DateTime.now().millisecondsSinceEpoch,
                            ),
                      ),
                    );
                  },
                  child: Text(
                    'Navigation Benchmark',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RenderingPage(
                              title: 'Rendering Benchmark',
                            ),
                      ),
                    );
                  },
                  child: Text(
                    'Rendering Benchmark',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnimationPage(
                              title: 'Animation Benchmark',
                            ),
                      ),
                    );
                  },
                  child: Text(
                    'Animation Benchmark',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ComputingPage(title: 'Computing Benchmark')),
                    );
                  },
                  child: Text(
                    'Computing Benchmark',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
