import 'package:arch_bookly/Features/home/domain/entityes/book_entity.dart';
import 'package:arch_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:arch_bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() {
    throw UnimplementedError();
  }
}
