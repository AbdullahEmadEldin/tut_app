// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:typed_data';

import 'package:tut_app/constants/constants.dart';

class SavedBookModel {
  final String id;
  final String bookName;
  final Uint8List? image;

  SavedBookModel({
    required this.id,
    required this.bookName,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AppConstants.sqlKeys.bookId: id,
      AppConstants.sqlKeys.bookName: bookName,
      AppConstants.sqlKeys.bookImage: image,
    };
  }

  factory SavedBookModel.fromMap(Map<String, dynamic> map) {
    return SavedBookModel(
      id: map[AppConstants.sqlKeys.bookId] as String,
      bookName: map[AppConstants.sqlKeys.bookName] as String,
      image: map[AppConstants.sqlKeys.bookImage] != null
          ? map[AppConstants.sqlKeys.bookImage] as Uint8List
          : Uint8List(0),
    );
  }
}
