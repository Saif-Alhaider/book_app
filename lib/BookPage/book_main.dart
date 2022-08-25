import 'package:book_app/BookPage/image_container.dart';
import 'package:flutter/material.dart';

import '../Reusable_Widgets/MainButton.dart';
import '../Reusable_Widgets/star_rating.dart';
import '../Reusable_Widgets/subButton.dart';
import '../Reusable_Widgets/title.dart';
import 'title_and_rate.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
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
                ImageContainer(imageLink: "https://api.lorem.space/image/book?w=150&h=224"),
                TitleAndRate(),
                Column(
                  children: [
                    const Text(
                      "Velit minim irure voluptate ullamco pariatur id veniam qui magna id ea. In sunt ullamco velit pariatur nulla eu laborum et quis aliquip ut. Adipisicing labore reprehenderit eu Lorem proident.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10,),
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
                        SizedBox(width: 10,),
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
                MainButton(
                  buttonFunction: () => null,
                  buttonTitle: "Buy Now For 49.68\$",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
