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
                curve: Interval(0.100, 0.400, curve: Curves.elasticInOut))),
        animationNameOpacity = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.350, 0.450, curve: Curves.easeIn))),
        animationLocationOpacity = Tween(begin: 0.0, end: 0.84).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.500, 0.600, curve: Curves.easeIn))),
        animationDividerWidth = Tween(begin: 0.0, end: 225.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.650, 0.750, curve: Curves.elasticInOut))),
        animationAboutOpacity = Tween(begin: 0.0, end: 0.85).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.750, 0.900, curve: Curves.easeIn))),
        animationLangScrollerXTranslation = Tween(begin: 60.0, end: 0.0)
            .animate(CurvedAnimation(
                parent: animationController,
                curve: Interval(0.830, 1.00, curve: Curves.ease))),
        animationLangScrollerOpacity = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.830, 1.0, curve: Curves.fastOutSlowIn)));

  final AnimationController animationController;

  final Animation<double> animationBgdropOpacity;
  final Animation<double> animationBgdropBlur;
  final Animation<double> animationImageSize;
  final Animation<double> animationNameOpacity;
  final Animation<double> animationLocationOpacity;
  final Animation<double> animationDividerWidth;
  final Animation<double> animationAboutOpacity;
  final Animation<double> animationLangScrollerXTranslation;
  final Animation<double> animationLangScrollerOpacity;
}
