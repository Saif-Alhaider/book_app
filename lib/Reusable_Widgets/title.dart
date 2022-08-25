import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight fontWeight;
  const CustomTitle({
    Key? key,
    required this.title,
    this.size = 30.0,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
            title,
            style: GoogleFonts.notoSans(fontSize: size, fontWeight: fontWeight),
          );
  }
}
