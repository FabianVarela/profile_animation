import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  @override
  TweenAnimationState createState() => TweenAnimationState();
}

class TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation = Tween(begin: 0.0, end: 10.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(from: 1.0);
        } else if (status == AnimationStatus.reverse) {
          this.setState(() {
            _counter = _counter - 400;
          });
        }
      })
      ..addListener(() {
        this.setState(() {
          _counter++;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
          _controller.isAnimating
              ? (_counter).toStringAsFixed(2)
              : "Let's begin",
          style: TextStyle(fontSize: 24 * animation.value + 16)),
      onTap: () {
        _controller.forward(from: 0);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
