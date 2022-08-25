import 'package:book_app/Books/AppBar/main_AppBar.dart';
import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Reusable_Widgets/title.dart';
import 'package:flutter/material.dart';

import '../Reusable_Widgets/bookInfoDisplay.dart';

class SavedBooksMain extends StatefulWidget {
  SavedBooksMain({Key? key}) : super(key: key);

  @override
  State<SavedBooksMain> createState() => _BooksPageState();
}

class _BooksPageState extends State<SavedBooksMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const CustomTitle(
            title: "Books",
          ),
          const SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: Books().savedBooks.length,
            itemBuilder: (context, index) {
              if (index == Books().allBooks.length - 1) {
                return Column(
                  children: [
                    BookInfoDisplay(index: index,bookShelf: Books().savedBooks),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                );
              }
              for (var element in Books().savedBooks) {
                print(element.isSaved);
              }
              return BookInfoDisplay(index: index,bookShelf: Books().savedBooks);
            },
          ))
        ],
      ),
    );
  }
}
