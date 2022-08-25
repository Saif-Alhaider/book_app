import 'package:flutter/material.dart';

import '../../Models/books_model.dart';
import 'profile_pic_name.dart';
import 'search_button.dart';
import 'package:get/get.dart';

class MainAppBar extends StatefulWidget {
  MainAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
    

    

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfilePicName(),
        
        SearchButton()
      ],
    );
  }
}
