import 'package:hive/hive.dart';

import '../../../Features/home/domain/entityes/book_entity.dart';
import '../../../constants.dart';

void saveBooksData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(kFeatureBox);
  box.addAll(books);
}
