import 'package:get/get.dart';

import 'books_model.dart';
// this data will be sent when navigated to the book page

class sentBookData {
  final Rx<List<Book>> fullBooks;
  final int index;
  sentBookData({
    required this.fullBooks,
    required this.index,
  });
  Map _sentData = {};
  get sentData {
    return _sentData = {
        "title": fullBooks.value[index].title,
        "author": fullBooks.value[index].author,
        "rate": fullBooks.value[index].rate,
        "description": fullBooks.value[index].description,
        "price": fullBooks.value[index].price,
        "imageLink": fullBooks.value[index].imageLink,
        "isCart": fullBooks.value[index].isCart,
        "isSaved":fullBooks.value[index].isSaved
      };
  }
}
