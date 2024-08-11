// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_localization/easy_localization.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/shared/data/models/book_sub_models.dart';

class Book {
  final String kind;
  final String id;

  /// in Google books API it's called volumeInfo
  final BookInfo bookInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;

  /// This book model based on the response from Google books API
  /// It has a lot of properties but we have selected some of them
  /// and the properties are listed below, not all of them are used.
  /// but may be used in the future.
  Book({
    required this.kind,
    required this.id,
    required this.bookInfo,
    required this.saleInfo,
    required this.accessInfo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kind': kind,
      'id': id,
      'volumeInfo': bookInfo.toJson(),
      'saleInfo': saleInfo.toJson(),
      'accessInfo': accessInfo.toJson(),
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      kind: map['kind'] as String,
      id: map['id'] as String,
      bookInfo: BookInfo.fromJson(map['volumeInfo'] as Map<String, dynamic>),
      saleInfo: SaleInfo.fromJson(map['saleInfo'] as Map<String, dynamic>),
      accessInfo:
          AccessInfo.fromJson(map['accessInfo'] as Map<String, dynamic>),
    );
  }
}

class BookInfo {
  String title;
  List<dynamic>? authors;
  String? publishedDate;
  bool? allowAnonLogging;
  ImageLinks? imageLinks;
  String? previewLink;
  String? infoLink;
  String? subtitle;
  String? description;
  List<dynamic>? categories;

  /// Holds the basic info about the book and the desired ones in out application.
  BookInfo({
    required this.title,
    this.authors,
    this.publishedDate,
    this.allowAnonLogging,
    this.imageLinks,
    this.previewLink,
    this.infoLink,
    this.subtitle,
    this.description,
    this.categories,
  });
//! Any AppStrings.notApplicable.tr() ('N/A') is a handling situation for the API. because a lot of books doesn't have the complete data.
  BookInfo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        authors = json['authors'] ?? [AppStrings.notApplicable.tr()],
        publishedDate = json['publishedDate'] ?? AppStrings.notApplicable.tr(),
        allowAnonLogging = json['allowAnonLogging'],
        imageLinks = json['imageLinks'] != null
            ? ImageLinks.fromJson(json['imageLinks'])
            : null,
        previewLink = json['previewLink'],
        infoLink = json['infoLink'],
        subtitle = json['subtitle'],
        description = json['description'],
        categories = json['categories'] ??
            [
              AppStrings.notApplicable.tr(),
            ];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['authors'] = authors;
    data['publishedDate'] = publishedDate;

    data['allowAnonLogging'] = allowAnonLogging;

    if (imageLinks != null) {
      data['imageLinks'] = imageLinks!.toJson();
    }
    data['previewLink'] = previewLink;
    data['infoLink'] = infoLink;
    data['subtitle'] = subtitle;
    data['description'] = description;
    data['categories'] = categories;
    return data;
  }
}
