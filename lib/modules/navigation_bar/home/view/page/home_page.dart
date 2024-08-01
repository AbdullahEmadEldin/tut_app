// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/helpers.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/core/theme/fonts_manager.dart';
import 'package:tut_app/modules/auth/view/widgets/register_button.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/banner_slider.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/falsh_sale_text.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/view/widgets/book_tile.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlashSaleText(),
              BannerSlider(),
              Container(
                color: AppColors.primaryGrade4.withOpacity(0.2),
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.trendingBooks,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: Helper.getResponsiveDimension(context,
                          baseDimension: 410),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          List<Book> books = [
                            Book(
                              name: 'Memory Of You',
                              image: 'assets/images/fake_book_cover.png',
                              category: 'Romance',
                              description: 'desc',
                              author: 'Abdullah',
                              price: '10',
                            ),
                            Book(
                              name: 'Memory Of You',
                              image: 'assets/images/fakeCover2.png',
                              category: 'Romance',
                              description: 'desc',
                              author: 'Abdullah',
                              price: '10',
                            ),
                            Book(
                              name: 'Memory Of You',
                              image: 'assets/images/fake_book_cover.png',
                              category: 'Romance',
                              description: 'desc',
                              author: 'Abdullah',
                              price: '10',
                            ),
                            Book(
                              name: 'Memory Of You',
                              image: 'assets/images/fakeCover2.png',
                              category: 'Romance',
                              description: 'desc',
                              author: 'Abdullah',
                              price: '10',
                            ),
                            Book(
                              name: 'Memory Of You',
                              image: 'assets/images/fake_book_cover.png',
                              category: 'Romance',
                              description: 'desc',
                              author: 'Abdullah',
                              price: '10',
                            ),
                            Book(
                              name: 'Memory Of You',
                              image: 'assets/images/fakeCover2.png',
                              category: 'Romance',
                              description: 'desc',
                              author: 'Abdullah',
                              price: '10',
                            ),
                          ];

                          return BookTile(
                            book: books[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
