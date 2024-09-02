// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_app/constants/app_strings.dart';
import 'package:tut_app/core/theme/colors/colors_manager.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/banner_slider.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/books_list_view.dart';
import 'package:tut_app/modules/navigation_bar/home/view/widgets/falsh_sale_text.dart';
import 'package:tut_app/modules/navigation_bar/library/view_model/cubit/get_saved_books_cubit.dart';
import 'package:tut_app/shared/data/models/book.dart';
import 'package:tut_app/shared/data/repos/book_category_enum.dart';
import 'package:tut_app/modules/navigation_bar/home/view_model/get_new_books_cubit.dart';

/// There is no need to rebuild the whole page.
/// but we are sing Stateful widget to trigger the API request one time in init state.
/// if you call the request in build method, every you jump to it from nav bar will call it again.
class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    BlocProvider.of<GetNewBooksCubit>(context)
        .getCategorizedBooks(category: BooksCategory.Fiction, lang: 'ar');
    BlocProvider.of<GetSavedBooksCubit>(context).getSavedBooks();
    super.initState();
  }

  /// This override required for AutomaticKeepAliveClientMixin which keeps the state alive.
  /// when you switch between pages inside nav bar
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                color: AppColors().colorScheme.primaryGrade4.withOpacity(0.2),
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.newRelease.tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    BlocBuilder<GetNewBooksCubit, GetNewBooksState>(
                      builder: (context, state) {
                        List<Book> books = [];
                        if (state is GetNewBookLoading) {
                          //This is for the shimmer effect representing the same outline form of the book tiles.
                          return BooksListView(
                            books: const [],
                            isLoading: true,
                          );
                        }
                        if (state is GetNewBooksSuccess) {
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
