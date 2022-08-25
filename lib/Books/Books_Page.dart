import 'package:book_app/Books/AppBar/main_AppBar.dart';
import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Reusable_Widgets/title.dart';
import 'package:flutter/material.dart';

import '../Reusable_Widgets/bookInfoDisplay.dart';

class BooksPage extends StatefulWidget {
  BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainAppBar(),
          const SizedBox(height: 30),
          const CustomTitle(
            title: "Books",
          ),
          const SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: Books().allBooks.length,
            itemBuilder: (context, index) {
              if (index == Books().allBooks.length - 1) {
                return Column(
                  children: [
                    BookInfoDisplay(index: index),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                );
              }
              return BookInfoDisplay(index: index);
            },
          ))
        ],
      ),
    );
  }
}
