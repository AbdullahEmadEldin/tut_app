// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/modules/auth/view/widgets/register_button.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/models/book_sub_models.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Text('Hello'),
        SizedBox(
          height: 700,
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: index == 3 ? 300 : 200,
                color: Colors.red,
              ),
            ),
            itemCount: 10,
          ),
        ),
      ],
    )));
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
