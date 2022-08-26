import 'package:book_app/Books/AppBar/main_AppBar.dart';
import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Models/sent_book_data.dart';
import 'package:book_app/Reusable_Widgets/title.dart';
import 'package:flutter/material.dart';

import '../Reusable_Widgets/bookInfoDisplay.dart';
import 'package:get/get.dart';

class BooksPage extends StatelessWidget {
  Rx<List<Book>> fullBooks = Rx<List<Book>>(Books().allBooks);

  BooksPage({Key? key}) : super(key: key);
  void searchBook(String query) {
    final suggestions = Books().allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();
    print("this is the book $suggestions");
    fullBooks.value = suggestions;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainAppBar(),
        const SizedBox(
          height: 40,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          // this the text field section
          child: TextField(
            onChanged: (value) => searchBook(value),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(20),
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 20),
              hintText: "Search...",
              suffixIcon: Icon(
                Icons.search,
                size: 35,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const CustomTitle(
          title: "Book List",
        ),
        const SizedBox(height: 40),
        Expanded(
          child: Obx(() => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: fullBooks.value.length,
                itemBuilder: (context, index) {
                  if (index == fullBooks.value.length - 1) {
                    return Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pushNamed(context, "/book",
                                  arguments: sentBookData(
                                          fullBooks: fullBooks, index: index)
                                      .sentData);
                            },
                            child: Obx(() => BookInfoDisplay(
                                index: index, bookShelf: fullBooks.value))),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    );
                  }
                  return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushNamed(context, "/book",
                            arguments:
                                sentBookData(fullBooks: fullBooks, index: index)
                                    .sentData);
                      },
                      child: Obx(() => BookInfoDisplay(
                          index: index, bookShelf: fullBooks.value)));
                },
              )),
        )
      ],
    );
  }
}
