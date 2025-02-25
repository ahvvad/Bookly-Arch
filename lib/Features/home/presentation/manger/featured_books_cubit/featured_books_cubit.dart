import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entityes/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
}
