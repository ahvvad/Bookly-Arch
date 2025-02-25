import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entityes/book_entity.dart';
import '../../../domain/use_cases/fetch_newst_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(NewestBooksInitial());
  final FetchNewstBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold(
      (failure) => emit(
        NewestBooksFailure(failure.message),
      ),
      (books) => emit(
        NewestBooksSuccess(books),
      ),
    );
  }
}
