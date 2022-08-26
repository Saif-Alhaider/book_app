import 'package:book_app/BookPage/image_container.dart';
import 'package:flutter/material.dart';

import '../Models/books_model.dart';
import '../Reusable_Widgets/MainButton.dart';
import '../Reusable_Widgets/subButton.dart';
import '../Reusable_Widgets/title.dart';
import 'title_and_rate.dart';

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic bookInfo = ModalRoute.of(context)?.settings.arguments;
    print(bookInfo);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back)),
                ),
                ImageContainer(imageLink: bookInfo['imageLink']),
                TitleAndRate(
                    title: bookInfo['title'],
                    author: bookInfo['author'],
                    rate: bookInfo['rate'].toInt()),
                Column(
                  children: [
                    Text(
                      bookInfo['description'],
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SubButton(
                            buttonFunction: () => null,
                            buttonTitle: "Preview",
                            height: 50,
                            icon: Icons.bar_chart_rounded,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SubButton(
                            buttonFunction: () => null,
                            buttonTitle: "Reviews",
                            height: 50,
                            icon: Icons.chat_outlined,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return MainButton(
                      buttonFunction: () {
                        setState(
                            () => bookInfo['isCart'] = !bookInfo['isCart']);

                        for (var element in Books().allBooks) {
                          if (element.title == bookInfo['title']) {
                            element.isCart = bookInfo['isCart'];
                          }
                        }
                      },
                      buttonTitle: bookInfo['isCart']
                          ? "Remove from Cart"
                          : "Buy Now For \$${bookInfo['price']}",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
