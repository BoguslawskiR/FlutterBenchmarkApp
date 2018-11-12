import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatableElement(
            animation: animation,
            multiplerValue: 100,
          ),
          AnimatableElement(
            animation: animation,
            multiplerValue: 200,
          ),
          AnimatableElement(
            animation: animation,
            multiplerValue: 300,
          ),
          AnimatableElement(
            animation: animation,
            multiplerValue: 400,
          ),
          AnimatableElement(
            animation: animation,
            multiplerValue: 500,
          ),
          AnimatableElement(
            animation: animation,
            multiplerValue: 600,
          ),
        ],
      ),
    );
  }
}

class AnimatableElement extends StatelessWidget {
  AnimatableElement({this.animation, this.multiplerValue});
  final Animation<double> animation;
  final int multiplerValue;
  @override
  Widget build(BuildContext contest) {
    return Transform.translate(
      offset: Offset(0.0, animation.value * multiplerValue),
      child: Container(
        color: Color.fromRGBO(98, 0, 238, 1.0),
        width: 10.0,
        height: 10.0,
      ),
    );
  }
}
