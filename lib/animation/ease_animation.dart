import 'package:flutter/material.dart';

class EaseAnimation extends StatefulWidget {
  @override
  EaseAnimationState createState() => EaseAnimationState();
}

class EaseAnimationState extends State<EaseAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1800));

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn)
          ..addListener(() {
            setState(() {});
          });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      "Hola a todos",
      style: TextStyle(fontSize: 19 * animation.value),
    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
