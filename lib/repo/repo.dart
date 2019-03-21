import 'package:profile_animation/model/profile.dart';

class RepoData {
  static final Profile profile = Profile(
      name: "Fabián Varela Bonett",
      location: "Bogotá, Colombia",
      logo: "logo.png",
      backdropPhoto: "profile.jpg",
      about: "Software developer, creating backend services, web applications "
          "and mobile applications, passionate creating things",
      languages: <Language>[
        Language(title: "C#", thumbnail: "", url: ""),
        Language(title: "Javascript", thumbnail: "", url: ""),
        Language(title: "Dart", thumbnail: "", url: ""),
        Language(title: "Kotlin", thumbnail: "", url: ""),
        Language(title: "Android", thumbnail: "", url: ""),
        Language(title: "Flutter", thumbnail: "", url: "")
      ]);
}
