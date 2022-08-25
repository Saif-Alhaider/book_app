import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageLink;
  const ImageContainer({
    Key? key,
    required this.imageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 310,
      child: Image.network(
        imageLink,
        fit: BoxFit.fill,
      ),
    );
  }
}
