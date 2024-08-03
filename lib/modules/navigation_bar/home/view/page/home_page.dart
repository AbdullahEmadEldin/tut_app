// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/banner_slider.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/books_list_view.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/falsh_sale_text.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/view_model/cubit/get_books_by_category_cubit.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // getting the books from Google books api and trigger the BLoC states.
    BlocProvider.of<GetBooksByCategoryCubit>(context)
        .getCategorizedBooks(category: '', lang: 'ar');

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
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.newRelease,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    BlocBuilder<GetBooksByCategoryCubit,
                        GetBooksByCategoryState>(
                      builder: (context, state) {
                        List<Book> books = [];
                        if (state is GetBooksByCategoryLoading) {
                          //This is for the shimmer effect representing the same outline form of the book tiles.
                          return BooksListView(
                            books: const [],
                            isLoading: true,
                          );
                        }
                        if (state is GetBooksByCategorySuccess) {
                          books = state.books;

                          return BooksListView(books: books, isLoading: false);
                        } else
                          //Todo: handle error UI...with some lottie animation
                          return Text('Some thing is wrong');
                      },
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
