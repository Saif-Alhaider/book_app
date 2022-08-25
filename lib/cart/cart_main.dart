import 'package:book_app/Books/AppBar/main_AppBar.dart';
import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Reusable_Widgets/title.dart';
import 'package:flutter/material.dart';

import '../Reusable_Widgets/bookInfoDisplay.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _BooksPageState();
}

class _BooksPageState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const CustomTitle(
            title: "Cart",
          ),
          const SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: Books().cartBooks.length,
            itemBuilder: (context, index) {
              if (index == Books().allBooks.length - 1) {
                return Column(
                  children: [
                    BookInfoDisplay(index: index,bookShelf: Books().cartBooks),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                );
              }
              for (var element in Books().cartBooks) {
                print(element.isCart);
              }
              return BookInfoDisplay(index: index,bookShelf: Books().cartBooks);
            },
          ))
        ],
      ),
    );
  }
}
