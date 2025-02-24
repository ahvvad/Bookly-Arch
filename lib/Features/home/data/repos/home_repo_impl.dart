import 'package:arch_bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:arch_bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:arch_bookly/Features/home/domain/entityes/book_entity.dart';
import 'package:arch_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:arch_bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
      List<BookEntity> books;
      books = homeLocalDataSources.fetchFeaturedBooks();
      if (books.isEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSources.fetchNewestBooks();
      if (books.isEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
