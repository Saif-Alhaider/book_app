import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:book_app/Books/AppBar/main_AppBar.dart';
import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Models/sent_book_data.dart';
import 'package:book_app/Reusable%20Functions/book_filter.dart';
import 'package:book_app/Reusable_Widgets/title.dart';

import '../Reusable_Widgets/bookInfoDisplay.dart';

class DisplayBooksPage extends StatefulWidget {
  final bool appbar;
  final String pageTitle;
  final Rx<List<Book>> fullBooks;

  const DisplayBooksPage({
    Key? key,
    required this.appbar,
    required this.pageTitle,
    required this.fullBooks,
  }) : 
  super(key: key);

  @override
  State<DisplayBooksPage> createState() => _DisplayBooksPageState();
}

class _DisplayBooksPageState extends State<DisplayBooksPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.fullBooks.value.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.appbar) ...[
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
              onChanged: (value) =>
                  BookFilter(fullBooks: widget.fullBooks).searchBook(value),
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
        ],
        const SizedBox(height: 30),
        CustomTitle(
          title: widget.pageTitle,
        ),
        const SizedBox(height: 40),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.fullBooks.value.length,
            itemBuilder: (context, index) {
              if (index == widget.fullBooks.value.length - 1) {
                return Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamed(context, "/book",
                              arguments: sentBookData(
                                      fullBooks: widget.fullBooks, index: index)
                                  .sentData);
                        },
                        child: Obx(() => BookInfoDisplay(
                            index: index, bookShelf: widget.fullBooks.value))),
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
                            sentBookData(fullBooks: widget.fullBooks, index: index)
                                .sentData);
                  },
                  child: Obx(() => BookInfoDisplay(
                      index: index, bookShelf: widget.fullBooks.value)));
            },
          ),
        )
      ],
    );
  }
}
