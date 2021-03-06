import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:profile_animation/model/profile.dart';
import 'package:profile_animation/ui/language_card.dart';
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
        children: <Widget>[
          _createLogoAvatar(),
          _createAboutProfile(),
          _createCourseScroller()
        ],
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

  Widget _createAboutProfile() {
    return Padding(
      padding: EdgeInsets.only(top: 14, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${profile.name}",
            style: TextStyle(
                color: Colors.white
                    .withOpacity(animation.animationNameOpacity.value),
                fontSize: 30 * animation.animationImageSize.value + 2,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "${profile.location}",
            style: TextStyle(
                color: Colors.white
                    .withOpacity(animation.animationLocationOpacity.value),
                fontWeight: FontWeight.w500),
          ),
          Container(
            color: Colors.white.withOpacity(0.7),
            margin: EdgeInsets.symmetric(vertical: 14),
            width: animation.animationDividerWidth.value,
            height: 1,
          ),
          Text(
            "${profile.about}",
            style: TextStyle(
                color: Colors.white
                    .withOpacity(animation.animationAboutOpacity.value),
                height: 1.4),
          )
        ],
      ),
    );
  }

  Widget _createCourseScroller() {
    return Padding(
      padding: EdgeInsets.only(
        top: 14,
      ),
      child: Transform(
        transform: Matrix4.translationValues(
            animation.animationLangScrollerXTranslation.value, 0, 0),
        child: SizedBox.fromSize(
          size: Size.fromHeight(250),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 7),
            itemCount: profile.languages.length,
            itemBuilder: (BuildContext context, int position) {
              var lang = profile.languages[position];
              return LanguageCard(lang);
            },
          ),
        ),
      ),
    );
  }
}
