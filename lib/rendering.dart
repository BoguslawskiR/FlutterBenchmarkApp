import 'package:flutter/material.dart';
import 'dart:async';

class RenderingPage extends StatefulWidget {
  RenderingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RenderingState createState() => _RenderingState();
}

class _RenderingState extends State<RenderingPage> {
  bool renderIndicator = false;
  bool buttonIndicator = true;

  List<Widget> _generateElements(render, pixelSum) {
    List<Widget> generatedArray = [];
    if (render == false) {
      return generatedArray.toList();
    }
    for (var i = 0; i < pixelSum / 100; i++) {
      generatedArray.add(Pixel());
    }
    return generatedArray.toList();
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    var pixelSum = sizes.height * sizes.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Wrap(
            children: _generateElements(renderIndicator, pixelSum),
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            child: Container(
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('RENDER'),
                    onPressed: buttonIndicator == true
                        ? () {
                            setState(() {
                              buttonIndicator = false;
                            });
                            Timer.run(() {
                              setState(() {
                                renderIndicator = true;
                              });
                            });
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Pixel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.red,
      ),
      width: 10.0,
      height: 10.0,
    );
  }
}
