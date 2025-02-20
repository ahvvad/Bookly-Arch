// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arch_bookly/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entityes/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
