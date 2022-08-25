import 'package:book_app/Books/AppBar/main_AppBar.dart';
import 'package:book_app/Models/books_model.dart';
import 'package:book_app/Reusable_Widgets/title.dart';
import 'package:flutter/material.dart';

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
              // ignore: prefer_const_constructors
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(5),
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Image.network(
                          "https://api.lorem.space/image/book?w=150&h=221"),
                    ),
                        SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTitle(
                            title: Books().allBooks[index].title,
                            size: 25,
                          ),
                          CustomTitle(
                            title: Books().allBooks[index].author,
                            size: 15,
                          ),
                          SizedBox(child: Text("Sint deserunt duis minim officia cillum occaecat laboris eu exercitation.  reprehenderit officia nostrud est proident et."))
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
