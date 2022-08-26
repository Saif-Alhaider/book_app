import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageLink;
  const ImageContainer({
    Key? key,
    required this.imageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 210,
      height: 310,
      fit: BoxFit.fill,
      imageUrl: imageLink,
      placeholder: (context, url) {
        return const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          ),
        );
      },
      errorWidget: (context, url, error) => Image.asset(
        "Assets/Images/placeholder.jpg",
        fit: BoxFit.fill,
      ),
    );
  }
}
