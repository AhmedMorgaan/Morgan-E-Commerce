// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LanguageItemModel {
  final String? name;
  final String? iconPath;
  final Locale? langLocale;
  final bool? viewFlag;

  LanguageItemModel({
    this.name,
    this.iconPath,
    this.viewFlag,
    this.langLocale,
  });
}
