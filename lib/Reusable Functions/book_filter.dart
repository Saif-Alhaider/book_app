import 'package:get/get.dart';

import '../Models/books_model.dart';
class BookFilter {
  final Rx<List<Book>> fullBooks;
  BookFilter({
    required this.fullBooks,
  });
  void searchBook(String query) {
    final suggestions = Books().allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();
    fullBooks.value = suggestions;
  }
}
