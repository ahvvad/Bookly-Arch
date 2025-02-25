import 'package:arch_bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_list_view.dart';

class FeaturedBooksListViewBolcBuilder extends StatelessWidget {
  const FeaturedBooksListViewBolcBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return const FeaturedBooksListView();
        } else if (state is FeaturedBooksFailure) {
          return Text('error: ${state.errMessage}');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
