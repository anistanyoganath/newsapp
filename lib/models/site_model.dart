import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'site_model.g.dart';

@HiveType(typeId: 1)
class SiteModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String link;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final Language language;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final Color bgColor;
  @HiveField(6)
  final Color fgColor;

  SiteModel(
      {required this.name,
      required this.link,
      required this.image,
      required this.language,
      required this.description,
      required this.bgColor,
      required this.fgColor});
}

enum Language {
  english,
  tamil,
  sinhala,
}

extension LanguageExtension on Language {
  String get name {
    String enumName = toString().split('.').last;
    return enumName[0].toUpperCase() + enumName.substring(1);
  }
}
