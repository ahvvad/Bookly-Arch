import 'package:arch_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:arch_bookly/constants.dart';
import 'package:arch_bookly/core/utils/api_service.dart';

import '../../../../core/utils/functions/save_books.dart';
import '../../domain/entityes/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming',
    );

    List<BookEntity> books = getBooksList(data);
    // cashing data
    saveBooksData(books, kFeatureBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science',
    );

    List<BookEntity> books = getBooksList(data);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
