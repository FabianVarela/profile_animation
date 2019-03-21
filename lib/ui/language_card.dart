import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:profile_animation/model/profile.dart';

class LanguageCard extends StatelessWidget {
  LanguageCard(this.language);

  final Language language;

  BoxDecoration _createShadowCorners() {
    return BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 10)
        ]);
  }

  Widget _createThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: <Widget>[
          Image.asset("assets/${language.thumbnail}"),
          Positioned(
            bottom: 12,
            right: 12,
            child: _createLinkButton(),
          )
        ],
      ),
    );
  }

  Widget _createLinkButton() {
    return Material(
      color: Colors.white24,
      type: MaterialType.circle,
      child: IconButton(
        icon: Icon(Icons.link),
        onPressed: () async {
          if (await canLaunch(language.url)) {
            await launch(language.url);
          }
        },
      ),
    );
  }

  Widget _createLanguageInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 4, right: 4),
      child: Text(
        "${language.title}",
        style: TextStyle(color: Colors.white.withOpacity(0.85)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: _createShadowCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: _createThumbnail(),
          ),
          Flexible(
            flex: 2,
            child: _createLanguageInfo(),
          )
        ],
      ),
    );
  }
}
