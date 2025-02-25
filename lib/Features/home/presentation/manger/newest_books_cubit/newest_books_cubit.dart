import 'package:arch_bookly/Features/home/domain/entityes/book_entity.dart';
import 'package:arch_bookly/Features/home/domain/use_cases/fetch_newst_books_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestdBooksUseCase) : super(NewestBooksInitial());

  final FetchNewstBooksUseCase fetchNewestdBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestdBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}