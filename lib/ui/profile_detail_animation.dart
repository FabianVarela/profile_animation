import 'package:flutter/material.dart';
import 'package:profile_animation/repo/repo.dart';
import 'package:profile_animation/ui/profile_detail_page.dart';

class ProfileDetailAnimation extends StatefulWidget {
  @override
  _ProfileDetailAnimationState createState() => _ProfileDetailAnimationState();
}

class _ProfileDetailAnimationState extends State<ProfileDetailAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1780));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileDetailPage(
        profile: RepoData.profile, controller: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
