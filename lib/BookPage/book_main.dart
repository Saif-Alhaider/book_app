import 'package:flutter/material.dart';

import '../Reusable_Widgets/MainButton.dart';
import '../Reusable_Widgets/star_rating.dart';
import '../Reusable_Widgets/subButton.dart';
import '../Reusable_Widgets/title.dart';

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
                Container(
                  width: 210,
                  height: 310,
                  child: Image.network(
                    "https://api.lorem.space/image/book?w=150&h=220",
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    const CustomTitle(
                      title: "paradise",
                    ),
                    SizedBox(height: 5,),
                    const Text(
                      "this is subtext",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 5,),
                    StarRating(),
                  ],
                ),
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
                        SubButton(
                          buttonFunction: () => null,
                          buttonTitle: "Preview",
                          height: 50,
                          width: 166.0,
                        ),
                        SubButton(
                          buttonFunction: () => null,
                          buttonTitle: "Preview",
                          height: 50,
                          width: 166.0,
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
