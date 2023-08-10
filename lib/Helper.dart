import 'dart:convert';

import 'package:api/HomeModel.dart';
import 'package:http/http.dart';

class ApiHelper {
  Future<List> apiCall() async {
    Uri uri = Uri.parse(
        "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/?limit=18");

    var response = await get(
      uri,
      headers: {
        "X-RapidAPI-Key": "0879344c6dmsha1627f90fd35f77p1ad740jsne6f395c3cb33",
        "X-RapidAPI-Host": "bhagavad-gita3.p.rapidapi.com",
      },
    );

    var json = jsonDecode(response.body);

    List l1 = json.map((e) => HomeModel.fromJson(e)).toList();

    return l1;
  }


  Future<List> api1Call({required index}) async {
    Uri uri = Uri.parse(
        "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/1/verses/$index/");

    var response = await get(
      uri,
      headers: {
        "X-RapidAPI-Key": "0879344c6dmsha1627f90fd35f77p1ad740jsne6f395c3cb33",
        "X-RapidAPI-Host": "bhagavad-gita3.p.rapidapi.com",
      },
    );

    var json = jsonDecode(response.body);

    List l1 = json.map((e) => Home1Model.fromJson(e)).toList();

    print(json);

    return l1;
  }
}




class Home1Model {
  int id;
  int verseNumber;
  int chapterNumber;
  String slug;
  String text;
  String transliteration;
  String wordMeanings;
  List<Commentary> translations;
  List<Commentary> commentaries;

  Home1Model({
    required this.id,
    required this.verseNumber,
    required this.chapterNumber,
    required this.slug,
    required this.text,
    required this.transliteration,
    required this.wordMeanings,
    required this.translations,
    required this.commentaries,
  });

  factory Home1Model.fromJson(Map<String, dynamic> json) => Home1Model(
    id: json["id"],
    verseNumber: json["verse_number"],
    chapterNumber: json["chapter_number"],
    slug: json["slug"],
    text: json["text"],
    transliteration: json["transliteration"],
    wordMeanings: json["word_meanings"],
    translations: List<Commentary>.from(json["translations"].map((x) => Commentary.fromJson(x))),
    commentaries: List<Commentary>.from(json["commentaries"].map((x) => Commentary.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "verse_number": verseNumber,
    "chapter_number": chapterNumber,
    "slug": slug,
    "text": text,
    "transliteration": transliteration,
    "word_meanings": wordMeanings,
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
    "commentaries": List<dynamic>.from(commentaries.map((x) => x.toJson())),
  };
}

class Commentary {
  int id;
  String description;
  String authorName;
  Language language;

  Commentary({
    required this.id,
    required this.description,
    required this.authorName,
    required this.language,
  });

  factory Commentary.fromJson(Map<String, dynamic> json) => Commentary(
    id: json["id"],
    description: json["description"],
    authorName: json["author_name"],
    language: languageValues.map[json["language"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "author_name": authorName,
    "language": languageValues.reverse[language],
  };
}

enum Language {
  ENGLISH,
  HINDI,
  SANSKRIT
}

final languageValues = EnumValues({
  "english": Language.ENGLISH,
  "hindi": Language.HINDI,
  "sanskrit": Language.SANSKRIT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
