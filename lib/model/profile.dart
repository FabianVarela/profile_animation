import 'package:meta/meta.dart';

class Profile {
  Profile(
      {@required this.name,
      @required this.location,
      @required this.logo,
      @required this.backdropPhoto,
      @required this.about,
      @required this.languages});

  final String name;
  final String location;
  final String logo;
  final String backdropPhoto;
  final String about;
  final List<Language> languages;
}

class Language {
  Language(
      {@required this.title, @required this.thumbnail, @required this.url});

  final String title;
  final String thumbnail;
  final String url;
}
