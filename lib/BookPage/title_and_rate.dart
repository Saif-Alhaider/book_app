import 'package:flutter/material.dart';

import '../Reusable_Widgets/star_rating.dart';
import '../Reusable_Widgets/title.dart';
import 'package:get/get.dart';
class TitleAndRate extends StatelessWidget {
  const TitleAndRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    StarRating(rate: Rx<int>(0),),
                  ],
                );
  }
}