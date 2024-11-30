import 'package:flutter/material.dart';

class SiteModel {
  final String name;
  final String link;
  final String image;
  final Language language;
  final String description;
  final Color bgColor;
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