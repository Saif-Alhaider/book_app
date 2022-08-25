import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => null,
          icon: Icon(
            Icons.more_vert_rounded,
            size: 30,
          ),
        ),
      ],
    );
  }
}
