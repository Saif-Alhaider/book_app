import 'package:book_app/Books/AppBar/main_AppBar.dart';
import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Reusable_Widgets/title.dart';
import 'package:flutter/material.dart';

import '../Reusable_Widgets/bookInfoDisplay.dart';
import 'package:get/get.dart';

class BooksPage extends StatefulWidget {
  BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  Rx<List<Book>> fullBooks = Rx<List<Book>>(Books().allBooks);
  void searchBook(String query) {
    final suggestions = Books().allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();
    print(suggestions);
    fullBooks.value = suggestions;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainAppBar(),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                // width: 150,
                child: TextField(
                  onChanged: (value) => searchBook(value),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 20),
                    hintText: "Search...",
                    suffixIcon: Icon(Icons.search,size: 35,),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const CustomTitle(
                title: "Book List",
              ),
              const SizedBox(height: 40),
              Expanded(
                  child: ListView.builder(
                physics: BouncingScrollPhysics(),
                // itemCount: fullBooks.length,
                itemCount: fullBooks.value.length,
                itemBuilder: (context, index) {
                  if (index == fullBooks.value.length - 1) {
                    return Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/book", arguments: {
                                "title": fullBooks.value[index].title,
                                "author": fullBooks.value[index].author,
                                "rate": fullBooks.value[index].rate,
                                "description":
                                    fullBooks.value[index].description,
                                "price": fullBooks.value[index].price,
                                "imageLink": fullBooks.value[index].imageLink,
                                "isCart": fullBooks.value[index].isCart,
                              });
                            },
                            child: BookInfoDisplay(
                                index: index, bookShelf: fullBooks.value)),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    );
                  }
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/book", arguments: {
                          "title": fullBooks.value[index].title,
                          "author": fullBooks.value[index].author,
                          "rate": fullBooks.value[index].rate,
                          "description": fullBooks.value[index].description,
                          "price": fullBooks.value[index].price,
                          "imageLink": fullBooks.value[index].imageLink,
                          "isCart": fullBooks.value[index].isCart,
                        });
                      },
                      child: BookInfoDisplay(
                          index: index, bookShelf: fullBooks.value));
                },
              ))
            ],
          ),
        );
      },
    );
  }
}
