import 'package:flutter/material.dart';

import 'profile_pic_name.dart';
import 'search_button.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

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
