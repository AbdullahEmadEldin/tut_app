// ignore_for_file: constant_identifier_names

import 'package:tut_app/constants/assets_paths.dart';

/// Instead of making a model for category, enum will be good enough for name and icon path.
enum BooksCategory {
  History(IconPath.history),
  Fiction(IconPath.fiction),
  Islam(IconPath.islam),
  Child(IconPath.child),
  Health(IconPath.health),
  Novels(IconPath.novel),
  Poetry(IconPath.poetry);

  final String icon;
  const BooksCategory(this.icon);
}
