import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:profile_animation/model/profile.dart';
import 'package:profile_animation/ui/profile_detail_intro_animation.dart';
import 'dart:ui' as ui;

class ProfileDetailPage extends StatelessWidget {
  ProfileDetailPage(
      {@required this.profile, @required AnimationController controller})
      : animation = ProfileDetailIntroAnimation(controller);

  final Profile profile;
  final ProfileDetailIntroAnimation animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: animation.animationController, builder: _createAnimation),
    );
  }

  Widget _createAnimation(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
          opacity: animation.animationBgdropOpacity.value,
          child: Image.asset(
            "assets/${profile.backdropPhoto}",
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
              sigmaX: animation.animationBgdropBlur.value,
              sigmaY: animation.animationBgdropBlur.value),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        )
      ],
    );
  }

  Widget _createContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_createLogoAvatar()],
      ),
    );
  }

  Widget _createLogoAvatar() {
    return Transform(
      transform: Matrix4.diagonal3Values(animation.animationImageSize.value,
          animation.animationImageSize.value, 1),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 110,
        margin: EdgeInsets.only(top: 32, left: 19),
        padding: EdgeInsets.all(3),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/${profile.logo}",
                width: 100,
                height: 100,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "${profile.name}",
                  style: TextStyle(
                      fontSize: 19 * animation.animationImageSize.value + 2,
                      color: Colors.white70),
                ))
          ],
        ),
      ),
    );
  }
}
