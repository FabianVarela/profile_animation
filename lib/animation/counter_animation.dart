import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.addListener(() {
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
