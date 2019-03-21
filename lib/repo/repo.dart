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
        Language(title: "C#", thumbnail: "csharp.jpg", url: "https://es.wikipedia.org/wiki/C_Sharp"),
        Language(title: "Javascript", thumbnail: "javascript.jpg", url: "https://es.wikipedia.org/wiki/JavaScript"),
        Language(title: "Dart", thumbnail: "dart.jpg", url: "https://es.wikipedia.org/wiki/Dart"),
        Language(title: "Kotlin", thumbnail: "kotlin.jpg", url: "https://es.wikipedia.org/wiki/Kotlin_(lenguaje_de_programaci%C3%B3n)"),
        Language(title: "Android", thumbnail: "android.jpg", url: "https://es.wikipedia.org/wiki/Android"),
        Language(title: "Flutter", thumbnail: "flutter.jpg", url: "https://es.wikipedia.org/wiki/Flutter_(software)")
      ]);
}
