import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:arch_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:arch_bookly/Features/home/domain/entityes/book_entity.dart';
import 'package:arch_bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:arch_bookly/Features/home/domain/use_cases/fetch_newst_books_use_case.dart';
import 'package:arch_bookly/Features/home/presentation/manger/cubit/newest_books_cubit.dart';
import 'package:arch_bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:arch_bookly/constants.dart';
import 'package:arch_bookly/core/utils/app_router.dart';
import 'package:arch_bookly/core/utils/functions/setup_service_locator.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeatureBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewstBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
