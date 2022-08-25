import 'package:book_app/Reusable_Widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/books_model.dart';
import 'title.dart';

class BookInfoDisplay extends StatelessWidget {
  final int index;
  const BookInfoDisplay({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 150,
      width: double.maxFinite,
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border.all(
          // color: Colors.black,
          color: Colors.transparent,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child:
                Image.network("https://api.lorem.space/image/book?w=150&h=221"),
          ),
          // SizedBox(width: 30),
          Expanded(
            child: Container(
              // width: 150,
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left: 18,top: 8),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitle(
                      title: Books().allBooks[index].title,
                      size: 18,
                    ),
                     SizedBox(height: 3),
                    Text(
                      Books().allBooks[index].author,
                      style: TextStyle(
                          color: Color.fromARGB(127, 6, 7, 13), fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    CustomTitle(
                      title: "\$${Books().allBooks[index].price}",
                      size: 20,
                    ),
                    SizedBox(height: 10),
                    StarRating(rate:Rx<int>(Books().allBooks[index].rate.toInt()),functional: false,)
                  ],
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [GestureDetector(
              child: Icon(Icons.bookmark_add_sharp),
            )],
          ),
        )
        ],
      ),
    );
  }
}
