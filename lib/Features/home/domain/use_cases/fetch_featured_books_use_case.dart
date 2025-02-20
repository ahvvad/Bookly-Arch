import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entityes/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    //check permission
    return homeRepo.fetchFeaturedBooks();
  }
}
