import 'package:arch_bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:arch_bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:arch_bookly/Features/home/domain/entityes/book_entity.dart';
import 'package:arch_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:arch_bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSources homeLocalDataSources;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSources,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksList = homeLocalDataSources.fetchFeaturedBooks();
      if (booksList.isEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var booksList = homeLocalDataSources.fetchNewestBooks();
      if (booksList.isEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
