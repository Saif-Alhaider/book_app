import 'package:book_app/Books/AppBar/main_AppBar.dart';
import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Reusable_Widgets/title.dart';
import 'package:flutter/material.dart';

import '../Models/sent_book_data.dart';
import '../Reusable_Widgets/bookInfoDisplay.dart';
import 'package:get/get.dart';

class SavedBooksMain extends StatefulWidget {
  const SavedBooksMain({Key? key}) : super(key: key);

  @override
  State<SavedBooksMain> createState() => _BooksPageState();
}

class _BooksPageState extends State<SavedBooksMain> {
  Rx<List<Book>> fullBooks = Rx<List<Book>>(Books().savedBooks);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const CustomTitle(
          title: "Saved",
        ),
        const SizedBox(height: 20),
        Expanded(
            child: ListView.builder(
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
                            arguments:
                                sentBookData(fullBooks: fullBooks, index: index)
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
                child: Obx(() =>
                    BookInfoDisplay(index: index, bookShelf: fullBooks.value)));
          },
        ))
      ],
    );
  }
}
