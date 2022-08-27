import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Reusable_Widgets/star_rating.dart';
import '../Reusable_Widgets/title.dart';
class TitleAndRate extends StatelessWidget {
  final String title;
  final String author;
  final int rate;
  const TitleAndRate({
    Key? key,
    required this.title,
    required this.author,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTitle(
                      textAlign: TextAlign.center,
                      title: title,
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      textAlign:TextAlign.left,
                      author,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(width: 180,child: StarRating(rate: Rx<int>(rate),functional: false),)
                  ],
                );
  }
}
