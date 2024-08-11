// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/lang_manager.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/models/book_sub_models.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              LanguageManager.changeAppLang(context,
                  lang: LanguageType.english);
            },
            child: Text(
              AppStrings.price.tr().tr(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              LanguageManager.changeAppLang(context, lang: LanguageType.arabic);
            },
            child: Text(
              AppStrings.price.tr().tr(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ));
  }

  List<Book> _getBooks() => [
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "This is a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "Test 2 for a long book title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
        Book(
            kind: 'kind',
            id: 'id',
            bookInfo: BookInfo(
              title: "title",
            ),
            saleInfo: SaleInfo(),
            accessInfo: AccessInfo()),
      ];
}
