import 'package:flutter/material.dart';

class ProfileDetailIntroAnimation {
  ProfileDetailIntroAnimation(this.animationController)
      : animationBgdropOpacity = Tween(begin: 0.5, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.000, 0.500, curve: Curves.ease))),
        animationBgdropBlur = Tween(begin: 0.0, end: 5.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.000, 0.800, curve: Curves.ease))),
        animationImageSize = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.100, 0.400, curve: Curves.elasticInOut)));

  final AnimationController animationController;

  final Animation<double> animationBgdropOpacity;
  final Animation<double> animationBgdropBlur;
  final Animation<double> animationImageSize;
//final Animation<double> animationNameOpacity;
//final Animation<double> animationLocationOpacity;
//final Animation<double> animationDividerWidth;
//final Animation<double> animationAboutOpacity;
//final Animation<double> animationLangScrollerXTranslation;
//final Animation<double> animationLangScrollerOpacity;
}
