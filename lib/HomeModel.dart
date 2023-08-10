// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) => List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  int id;
  String name;
  String slug;
  String nameTransliterated;
  String nameTranslated;
  int versesCount;
  int chapterNumber;
  String nameMeaning;
  String chapterSummary;
  String chapterSummaryHindi;

  HomeModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.nameTransliterated,
    required this.nameTranslated,
    required this.versesCount,
    required this.chapterNumber,
    required this.nameMeaning,
    required this.chapterSummary,
    required this.chapterSummaryHindi,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    nameTransliterated: json["name_transliterated"],
    nameTranslated: json["name_translated"],
    versesCount: json["verses_count"],
    chapterNumber: json["chapter_number"],
    nameMeaning: json["name_meaning"],
    chapterSummary: json["chapter_summary"],
    chapterSummaryHindi: json["chapter_summary_hindi"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "name_transliterated": nameTransliterated,
    "name_translated": nameTranslated,
    "verses_count": versesCount,
    "chapter_number": chapterNumber,
    "name_meaning": nameMeaning,
    "chapter_summary": chapterSummary,
    "chapter_summary_hindi": chapterSummaryHindi,
  };
}




